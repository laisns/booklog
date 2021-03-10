class UserTagsController < ApplicationController
  before_action :get_user
  def index
    @tags = @user.tags
  end

  def new
    @tag = Tag.new
  end

  def create

  end

  private

  def get_user
    return @user = User.find(params[:user_id]) unless params[:user_id].nil?
    @user = @list.user
  end
end
