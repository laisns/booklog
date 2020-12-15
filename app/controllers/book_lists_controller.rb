class BookListsController < ApplicationController
  before_action :get_book_list, only: :destroy
  def new;end

  def create;end

  def destroy
    book_list = BookList.find(params[:id])
    book_list.destroy
    redirect_to new_user_book_path(list: @list.id)
    if book_list.destroyed?
      flash[:success] = "Book removed from list!"
    else
      flash[:alert] = "Something went wrong. Please try again"
    end
  end

  private

  def book_list_params
    params.require(:book_list).permit(:book_id, :list_id, :created_at,
                                      :updated_at)
  end

  def get_book_list
    @list = BookList.find(params[:id]).list
  end
end
