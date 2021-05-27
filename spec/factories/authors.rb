FactoryBot.define do
  factory :author do
    sequence(:name) { |n| "Author #{n}" }
    birth_date { Time.zone.now }
    nationality { 'Gallifreian' }
  end
end