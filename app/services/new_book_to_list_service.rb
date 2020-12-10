class NewBookToListService
  attr_reader :errors

  def initialize(params, list)
    @errors = []
    @list = list
    @user = list.user
    @book_id = params[:book_id]
    @user_book_params = params
  end

  def add_new_user_book_to_list
    create_or_update_user_book!(@user_book_params)
  end

  private

  def create_or_update_user_book!(params)
    ActiveRecord::Base.transaction do
      if user_has_book_saved?
        @user.user_books.detect { |ub| ub.book_id == @book_id.to_i }
             .update!(params.except(:book_id, :user_id))
      else
        @user.user_books.create!(params)
      end
      raise ActiveRecord::RecordInvalid if book_already_in_the_list?
      add_book_to_list(@list)
    end
  rescue ActiveRecord::RecordInvalid => exception
    @errors << exception.message
  end

  def user_has_book_saved?
    @user.user_books.where(book_id: @book_id.to_i).exists?
  end

  def book_already_in_the_list?
    @list.book_lists.where(book_id: @book_id.to_i).exists?
  end

  def add_book_to_list(list)
    list.book_lists.create!(list_id: list.id, book_id: @book_id.to_i)
  end
end
