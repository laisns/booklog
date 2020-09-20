class UserBooksController < ApplicationController
  def new
  end

  private

  def user_books_params
    params.require(:user_books).permit(:book_status, :favorite_book,
                                       :favorite_author, :user_id, :book_id)
  end
end
