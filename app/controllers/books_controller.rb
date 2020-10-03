class BooksController < ApplicationController
  def search
    q = params[:q]
    @book = Book.where("title LIKE ?", "%#{q}%").limit(8)
    respond_to do |format|
      format.html
      format.json  { render :json => @book }
    end
  end
end
