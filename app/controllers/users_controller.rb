class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  before_action :require_user_ownership, only: %i[edit update destroy]
  skip_before_action :require_login, only: %i[new create]

  def index
    @users = User.all.order(id: :asc).page(params[:page]).per(12)
  end

  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path, success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :new
    end
  end

  def edit; end

  def update
    if params[:user][:remove_avatar] == '1'
      @user.remove_avatar!
      @user.save
    end

    if @user.update(user_profile_params)
      redirect_to user_path(@user), success: t('defaults.message.updated', item: t('.profile'))
    else
      flash.now[:danger] = t('defaults.message.not_updated', item: t('.profile'))
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path, success: t('defaults.message.deleted', item: 'アカウント')
  end

  def reviews
    @reviews = current_user.reviews.includes(:brewery).order(created_at: :desc).page(params[:page]).per(5)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def user_profile_params
    params.require(:user).permit(:avatar, :avatar_cache, :remove_avatar, :living_place, :favorite_liquor_type, :self_introduction)
  end

  def require_user_ownership
    return if @user.id == current_user.id

    redirect_back_or_to root_path, danger: t('defaults.message.not_authorized')
    nil
  end
end
