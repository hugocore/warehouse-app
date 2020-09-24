FactoryBot.define do
  factory :product do
    title { Faker::Name.name }
    description { Faker::Name.name }

    variants { build_list :variant, 1 }
  end
end
