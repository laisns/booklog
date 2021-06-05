class User < ApplicationRecord
  include Recommendation
  include PublicActivity::Model
  tracked

  store :settings, accessors: [:birthday, :personal_activity], coder: JSON
  has_one_attached :avatar
  has_many :user_books
  has_many :books, through: :user_books
  has_many :lists, dependent: :destroy
  has_many :user_tags
  has_many :tags, through: :user_tags

  has_secure_password

  validates :name, presence: true
  validates :login_name, presence: true, uniqueness: { case_sensitive: false }

  def recent_lists
    lists.last(3)
  end

  def favorite_books
    user_books.favorite_books.map(&:book)
  end

  def favorite_authors
    user_books.favorite_authors.map(&:book).map(&:author)
  end

  def recent_activity
    PublicActivity::Activity.order('created_at desc')
        .where(owner_type: "User", owner_id: id)
        .group_by { |activity| activity.updated_at.to_date }
  end

  def update_password(password, password_confirmation)
    self.update(password: password, password_confirmation: password_confirmation)
  end

  def attach_avatar(avatar)
    avatar_file = "#{avatar}.png"
    path = "app/assets/images/avatars/#{avatar_file}"
    self.avatar.attach(io: File.open(path), filename: avatar_file,
                        content_type: 'image/png')
  end
end
