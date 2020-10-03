class BookList < ApplicationRecord
  belongs_to :list
  belongs_to :book
end
