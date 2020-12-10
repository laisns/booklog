class BookList < ApplicationRecord
  belongs_to :list
  belongs_to :book

  delegate :user, to: :list

  validates_uniqueness_of :book_id, scope: :list_id
end
