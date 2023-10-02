FactoryBot.define do
  factory :message do
    room
    body { 'Text' }
  end
end
