class User < ApplicationRecord
  has_many :books, through: :user_books
  has_many :lists
  has_many :user_books

  has_secure_password

  validates :login_name, presence: true, uniqueness: true
end
