class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :require_login
  add_flash_types :success

  def not_authenticated
    redirect_to login_path, alert: t('defaults.message.require_login')
  end

  def access_denied(_exception)
    redirect_to root_path, alert: t('defaults.message.admin_only')
  end
end
