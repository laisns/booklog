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
      flash[:notice] = "Your account was created successfully"
      redirect_to root_path
    else
      flash.now.alert = "Something went wrong. Please try again"
      render :new
    end
  end

  def edit
  end

  def show
    # @user = User.find(params[:id])
    # @user = User.find_by(login_name: params[:login_name])
    @user = current_user
  end

  def update
    updated = user.update!(user_params)
    set_avatar
  end

  private

  def user_params
    params.require(:user).permit(:name, :login_name, :birth_date,
                                 :password, :password_confirmation, :avatar)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def set_avatar
    return unless params[:avatar]
    UserAvatarService.new(user_params).attach_avatar
  end
end
