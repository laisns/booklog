FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "User #{n}" }
    sequence(:login_name) { |n| "username#{n}" }
    password_digest {"asdf"}
  end
end