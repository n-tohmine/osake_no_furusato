module LoginHelper
  def login(user)
    visit login_path
    fill_in 'email', with: user.email
    fill_in 'password', with: 'password000'
    click_button 'ログイン'
    expect(page).to have_css('#alert-border-1', text: 'ログインしました')
  end
end