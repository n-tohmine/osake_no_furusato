require 'rails_helper'

RSpec.describe "Reviews", type: :system do
  let(:user) { create(:user) }
  let(:brewery) { create(:brewery) }

  before do
    Selenium::WebDriver.logger
    login(user)
  end
  
  context 'レビュー送信' do
    it 'レビューが表示される' do
      brewery = create(:brewery)
      find('#brewery-search-button').click
      find("#brewery-#{brewery.id}").click
      review_a = 'テストレビュー投稿。テストブルワリー。'
      fill_in 'review[content]', with: review_a
      find('#stars').find("img[alt='5']").click
      click_button '送信'
      expect(page).to have_content(review_a)
    end
  end

  context 'レビュー送信' do
    it '2回連続でレビューを投稿、リロードなしで2件とも表示される' do
      brewery = create(:brewery)
      find('#brewery-search-button').click
      find("#brewery-#{brewery.id}").click
      review_a = 'テストレビュー投稿。テストブルワリー。'
      fill_in 'review[content]', with: review_a
      find('#stars').find("img[alt='5']").click
      click_button '送信'
      expect(page).to have_content(review_a)
      review_b = 'テストレビュー投稿2。テストブルワリー。'
      fill_in 'review[content]', with: review_b
      find('#stars').find("img[alt='5']").click
      click_button '送信'
      expect(page).to have_content(review_a)
      expect(page).to have_content(review_b)
    end
  end

  context 'レビュー削除' do
    it '正常にレビューを削除できる' do
      brewery = create(:brewery)
      find('#brewery-search-button').click
      find("#brewery-#{brewery.id}").click
      review_a = 'テストレビュー投稿。テストブルワリー。'
      fill_in 'review[content]', with: review_a
      find('#stars').find("img[alt='5']").click
      click_button '送信'
      expect(page).to have_content(review_a)
      find('#delete_review_button').click
      page.driver.browser.switch_to.alert.accept
      expect(page).to have_css('#alert-border-1', text: 'レビューを削除しました')
      expect(page).to have_no_content(review_a)
    end
  end

  context 'レビュー編集' do
    it 'レビューを更新できる' do
      brewery = create(:brewery)
      user = create(:user, name: 'user_a')
      review_content = 'テストレビュー投稿。テストブルワリー。'
      review = create(:review, user: user, brewery: brewery, content: review_content)
      find('#brewery-search-button').click
      find("#brewery-#{brewery.id}").click
      expect(page).to have_content(review_content)
      expect(page).to have_css("#js-textarea-review-#{review.id}", visible: :hidden)
      page.execute_script("document.querySelector('#js-textarea-review-box-#{review.id}').style.display = 'block';")
      expect(page).to have_content('更新')
      expect(page).to have_content('キャンセル')
      review_content_update = 'テストレビュー投稿更新。テストブルワリー2。'
      page.execute_script("document.querySelector('#js-textarea-review-#{review.id}').value = '#{review_content_update}';")
      click_button '更新'
      page.has_content?(review_content_update, wait: 10)
    end
  end
end
