class List < ApplicationRecord
  include PublicActivity::Model
  tracked owner: :user

  has_many :book_lists, :dependent => :destroy
  has_many :books, -> { distinct }, through: :book_lists
  belongs_to :user
end
