FactoryBot.define do
  factory :package do
    package_name { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    weight { Faker::Number.decimal(l_digits: 2) }
  end
end
