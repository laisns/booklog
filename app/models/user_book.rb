class UserBook < ApplicationRecord
  belongs_to :book
  belongs_to :user

  TO_READ = 0
  READING = 1
  READ = 2
end
