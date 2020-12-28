class BooksController < ApplicationController
  before_action :set_author, only: [:new, :create, :update]
  def new
    @user = current_user
    @book = @author.books.build

    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @book = @author.books.build(book_params)
    if @book.save
      redirect_to author_path(@author)
      flash[:success] = "New book added!"
    else
      redirect_to author_path(@author)
      flash[:warning] = "Something went wrong. Please try again"
    end
  end

  def edit
    @book = Book.find(params[:id])
    @author = @book.author
  end

  def update
    @book = Book.find(params[:id])
    updated = @book.update(book_params)
    if updated
      redirect_to author_path(@author)
      flash[:success] = "Book information edited"
    else
      redirect_to author_path(@author)
      flash[:warning] = "Something went wrong. Please try again"
    end
  end

  def search
    q = params[:q]
    @book = Book.where("title LIKE ?", "%#{q}%").limit(8)
    respond_to do |format|
      format.html
      format.json  { render :json => @book }
    end
  end

  private

  def book_params
    params.require(:book).permit(:author_id, :genre_id, :title,
                                 :release_year, :synopsis, :language)
  end

  def set_author
    author_id = params[:author].presence || book_params[:author_id]
    @author = Author.find(author_id)
  end
end
