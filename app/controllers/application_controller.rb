class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :require_login
  add_flash_types :success
end
