FactoryBot.define do
  factory :user_book do
    book_status { 0 }
    favorite_book { false }
    favorite_author { false }
  end
end