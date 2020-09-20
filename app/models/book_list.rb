class BookList < ApplicationRecord
  belongs_to :list
  belongs_to :book

  accepts_nested_attributes_for :book
end
