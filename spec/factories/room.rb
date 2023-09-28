FactoryBot.define do
  factory :room do
    sequence(:title) { |n| "Title#{n}" }
  end
end
