class UserBooksController < ApplicationController
  before_action :get_user
  before_action :get_list, only: [:create, :new, :toggle_params]
  before_action :set_user_book, only: [:edit, :update, :toggle_params]

  def index
    @user_books = @user.user_books
  end

  def new
    @user_book = @user.user_books.build
  end

  def create
    @user_book = NewBookToListService.new(user_books_params, @list)
    @user_book.add_new_user_book_to_list
    redirect_to new_user_book_path(list: @list.id)
    if @user_book.errors.empty?
      flash[:success] = "Book added successfully"
    else
      flash[:warning] = "#{@user_book.errors.join("\n")}"
    end
  end

  def edit;end

  def update
    updated = @user_book.update!(user_books_params)
    flash.now.alert = "Something went wrong. Please try again" unless updated
    flash.now[:notice] = "List successfully edited!"
  end

  def toggle_params
    attribute = params[:attribute]
    if attribute == 'book_status'
      @user_book.update!(book_status: params[:value].to_i)
    else
      @user_book.toggle!(attribute)
    end
    render json: { attribute: attribute, value: params[:value] }
  end

  private

  def user_books_params
    params.permit(:book_status, :favorite_book, :favorite_author,
                  :user_id, :book_id)
  end

  def set_user_book
    @user_book = UserBook.find(params[:id])
  end

  def get_user
    @user = current_user
  end

  def get_list
    return @list = List.find(params[:list]) if params[:list].present?
    @list = List.find(params.values.first[:list])
  end

  def add_book_to_list(list)
    list.book_lists.create(list_id: list.id, book_id: @user_book.book_id)
  end
end
