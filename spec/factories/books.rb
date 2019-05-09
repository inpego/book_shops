FactoryBot.define do
  factory :book do
    publisher
    title { Faker::Book.title }
  end
end
