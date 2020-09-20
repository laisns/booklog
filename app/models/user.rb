class User < ApplicationRecord
  has_one_attached :avatar
  has_many :books, through: :user_books
  has_many :lists, dependent: :destroy
  has_many :user_books

  has_secure_password

  validates :login_name, presence: true, uniqueness: true
end

def recent_lists
  user.lists.last(3)
end