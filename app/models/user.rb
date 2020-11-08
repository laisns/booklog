class User < ApplicationRecord
  include PublicActivity::Model
  tracked

  has_one_attached :avatar
  has_many :books, through: :user_books
  has_many :lists, dependent: :destroy
  has_many :user_books

  has_secure_password

  validates :name, presence: true
  validates :login_name, presence: true, uniqueness: { case_sensitive: false }
end

def recent_lists
  user.lists.last(3)
end