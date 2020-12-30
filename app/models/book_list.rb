class BookList < ApplicationRecord
  belongs_to :list
  belongs_to :book

  delegate :user, to: :list
  delegate :author, to: :book
  delegate :title, to: :book

  validates_uniqueness_of :book_id, scope: :list_id

  def get_user_book
    user.user_books.by_book_id(book_id).first
  end
end
