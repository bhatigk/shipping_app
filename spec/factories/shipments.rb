FactoryBot.define do
  factory :shipment do
    source_location { { street_address: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state, zip_code: Faker::Address.zip_code } }
    target_location { { street_address: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state, zip_code: Faker::Address.zip_code } }

    association :customer
    association :delivery_partner
    association :package
  end
end
