class UserBook < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :book_id, uniqueness: true

  TO_READ = 0
  READING = 1
  READ = 2
end
