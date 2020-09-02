class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(login_name: params[:session][:login_name].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id.to_s
      redirect_to user_path(user.login_name), notice: 'Logged In!'
    else
      flash.now.alert = "Incorrect user or password, try again"
      render 'users/new'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: 'Logged out successfully!'
  end
end
