require 'httparty'
class HomeController < ApplicationController
  include HTTParty
  def index
    redirect_to user_path(current_user.login_name) if current_user
  end

  def show
  end

  def search
    @user = current_user
  end

  def search_results
    @user = current_user
    q = params[:q]
    @results = Book.joins(:author).where("title LIKE ? OR authors.name LIKE ?",
                                         "%#{q}%", "%#{q}%")
  end

  def get_search_response
    # respond_to do |format|
    #   format.html
    #   format.json  { render :json => @results }
    # end
    title = params[:q]
    response = HTTParty.get("https://openlibrary.org/search.json?title=#{title}")
    work_key = response['docs'].first['key']
    # work =
    redirect_to search_results_path
  end
end
