class Book < ApplicationRecord
  belongs_to :author
  belongs_to :genre
  has_many :book_editions, dependent: :destroy
  has_many :book_lists
  has_many :lists, through: :book_lists
end
