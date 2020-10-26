class AuthorsController < ApplicationController
  def show
    @user = current_user
    @author = Author.find(params[:id])
  end
end
