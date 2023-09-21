require 'rails_helper'

RSpec.describe "PasswordResets", type: :system do
  let(:user) { create(:user) }
  
  before do
    Selenium::WebDriver.logger
    visit login_path
  end

  describe 'パスワードリセット' do
    context 'ログインページに遷移' do
      it 'パスワードリセット画面へのリンクが正しく表示されている' do
        expect(page).to have_content ('パスワードをお忘れの方はこちら')
      end
    end
  end

  describe 'パスワードリセット' do
    context 'フォームの入力値が正常' do
      it 'パスワードリセットが成功' do
        click_link('password_forget')
        fill_in 'email', with: user.email
        click_button '送信'
        expect(page).to have_css('#alert-border-1', text: 'パスワードリセット手順を送信しました')
        visit "password_resets/#{user.reload.reset_password_token}/edit"
        expect(page).to have_content(user.email)
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'
        click_button '送信'
        expect(page).to have_css('#alert-border-1', text: 'パスワードを変更しました')
        expect(page).to have_css('#login-page')
      end
    end
  end
end
