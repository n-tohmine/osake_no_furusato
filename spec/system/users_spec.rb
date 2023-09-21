require 'rails_helper'

RSpec.describe "Users", type: :system do
  let(:user) { create(:user) }

  before do
    Selenium::WebDriver.logger
  end

  describe 'ログインユーザー' do
    context '醸造所詳細ページの表示' do
      it 'ログインユーザー用のページにアクセスできる' do
        brewery = create(:brewery)
        login(user)
        expect(page).to have_css('#top-page')
        find('#brewery-search-button').click
        expect(page).to have_content(brewery.name)
        find("#brewery-#{brewery.id}").click
        expect(page).to have_content('評価')
        expect(page).to have_content('気になるリスト')
        expect(page).to have_content('お気に入りリスト')
      end
    end
  end

  describe '未ログインユーザー' do
    context '醸造所詳細ページの表示' do
      it '未ログインユーザー用のページにアクセスできる' do
        brewery = create(:brewery)
        visit brewery_path(brewery.id)
        expect(page).to have_content(brewery.name)
        expect(page).to have_content('みんなのレビュー')
        expect(page).to have_no_content('評価')
        expect(page).to have_no_content('気になる')
        expect(page).to have_no_content('お気に入り')
      end
    end
  end

  describe 'ログインユーザー' do
    context 'プロフィール編集' do
      it 'アカウントが削除できる' do
        login(user)
        visit edit_user_path(user)
        click_link('delete_account_button')
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_css('#alert-border-1', text: 'アカウントを削除しました')
      end
    end
  end

  describe 'ログインユーザー' do
    context 'プロフィール編集' do
      it 'プロフィール画像が削除できる' do
        login(user)
        visit edit_user_path(user)
        avatar_path = Rails.root.join('app', 'assets', 'images', 'default_avatar.png')
        attach_file('user[avatar]', avatar_path, make_visible: true)
        click_button '更新'
        expect(page).to have_css('#alert-border-1', text: 'プロフィールを更新しました')
        visit edit_user_path(user)
        expect(page).to have_content('画像を削除する')
        check('remove_avatar')
        click_button '更新'
        visit edit_user_path(user)
        expect(page).to have_no_content('画像を削除する')
      end
    end
  end

  describe 'ログインユーザー' do
    context 'プロフィール編集' do
        it '更新に失敗' do
          login(user)
          visit edit_user_path(user)
          long_text = 'a' * 301
          fill_in 'user[self_introduction]', with: long_text
          click_button '更新'
          expect(page).to have_content('自己紹介は300文字以内で入力してください')
          expect(page).to have_css('#alert-border-2', text: 'プロフィールを更新できませんでした')
        end
      end
    end

    describe '一般ログインユーザー' do
      context '管理画面へアクセス' do
        it 'アクセスに失敗' do
          login(user)
          visit admin_root_path
          expect(page).to have_css('#alert-border-2', text: '管理者専用ページです')
        end
      end
    end
end
