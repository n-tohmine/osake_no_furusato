require 'webdrivers/chromedriver'
RSpec.configure do |config|
  config.before(:each, type: :system) do
    # driven_by(:selenium_chrome)
    driven_by(:selenium_chrome_headless)
  end
end