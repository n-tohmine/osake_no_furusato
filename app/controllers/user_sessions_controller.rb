class UserSessionsController < ApplicationController
  skip_before_action :require_login

  def create
    @user = login(params[:email], params[:password])

    if @user
      redirect_back_or_to(:users, success: t('.success'))
    else
      flash.now[:danger] = t('.fail')
      render :new
    end
  end

  def destroy
    logout
    redirect_to(:users, success: t('.success'))
  end
end
