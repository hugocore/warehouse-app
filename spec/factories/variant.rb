FactoryBot.define do
  factory :variant do
    sku { Faker::Name.name }
    quantity { rand(1..10) }
  end
end
