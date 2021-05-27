FactoryBot.define do
  factory :list do
    sequence(:name) { |n| "List #{n}" }
    progress { 60 }
  end
end