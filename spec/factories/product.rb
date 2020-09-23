FactoryBot.define do
  factory :product do
    title { Faker::Name.name }
    description { Faker::Name.name }
  end
end
