class List < ApplicationRecord
  has_many :books, through: :book_lists
  belongs_to :user
end
