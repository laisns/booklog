class UsersController < ApplicationController
  layout 'application', only: [:new, :create]
  before_action :set_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.login_name.downcase!
    if @user.save
      set_avatar
      session[:user_id] = @user.id
      redirect_to root_path
      flash[:notice] = "Your account was created successfully"
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
    if params[:password].present? && params[:password_confirmation].present?
      update_password(@user, params[:password], params[:password_confirmation])
    end
    updated = @user.update(user_params.except(:password, :password_confirmation))
    if updated
      set_avatar
      redirect_to user_path(@user)
      flash[:notice] = "Your account was created successfully"
    else
      render :show
      flash.now.alert = "Something went wrong. Please try again"
    end
  end

  def update_password(user, password, password_confirmation)
    error_msg = I18n.t('active_record.users.validations.password_mismatch')
    changed_password = user.update(password: password,
                                   password_confirmation: password_confirmation)
    flash[:notice] = error_msg unless changed_password
    flash[:notice] = 'Password was updated!'
    redirect_to user_path(user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :login_name, :birth_date,
                                 :password, :password_confirmation, :avatar)
  end

  def set_user
    @user = User.find_by_login_name(params[:id])
  end

  def set_avatar
    return unless params[:avatar]
    UserAvatarService.new(user_params).attach_avatar
  end
end
