class UsersController < ApplicationController
  layout 'application', only: [:new, :create]
  before_action :set_user, only: [:edit, :update, :set_avatar]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.login_name.downcase!
    if @user.save
      session[:user_id] = @user.id
      attach_avatar(@user.id)
      redirect_to root_path
      flash[:notice] = "Your account was created successfully. Welcome!"
    else
      redirect_to register_path
      flash[:alert] = "Something went wrong. Please try again #{@user.errors.messages}"
    end
  end

  def edit;end

  def show
    @user = current_user
  end

  def update
    if user_params[:password].present? && user_params[:password_confirmation].present?
      updated = @user.update_password(user_params[:password],
                                      user_params[:password_confirmation])
      flash_error_or_success(updated, user_params[:password].present?)
    else
      updated = @user.update(user_params.except(:password,
                                                :password_confirmation))
      flash_error_or_success(updated, user_params[:password].present?)
    end
  end

  def flash_error_or_success(updated, password)
    msg_update = password ? 'validations.password_success' : 'update'
    msg_error = password ? 'validations.password_mismatch' : 'validations.errors'
    redirect_to user_path(@user)
    if updated
      flash[:success] = I18n.t("active_record.users.#{msg_update}")
    else
      flash.now[:error] = I18n.t("active_record.users.#{msg_error}")
    end
  end

  def set_avatar
    attached = attach_avatar(params[:id])
    redirect_to user_path(@user)
    flash[:success] = "Avatar defined!" if attached
  end

  private

  def user_params
    params.require(:user).permit(:name, :login_name, :birth_date,
                                 :password, :password_confirmation, :avatar,
                                 :settings, :personal_activity, :birthday)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def attach_avatar(user_id)
    UserAvatarService.new(user_id, params[:avatar]).attach_file
  end
end
