require 'httparty'
class HomeController < ApplicationController
  include HTTParty
  def index
  end

  def show
  end

  def search
  end

  def get_search_response
    binding.pry
    title = params[:isbn]
    # response = HTTParty.post("https://openlibrary.org/api/books?bibkeys=ISBN:#{isbn}&jscmd=data&format=json")
    response = HTTParty.post("https://openlibrary.org/search.json?title=#{title}")
    resp = response
    redirect_to home_path
  end
end
