FactoryBot.define do
  factory :role do
    name { Faker::Name.name }

    factory :role_admin do
      name { "admin" }
    end

    factory :role_customer do
      name { "customer" }
    end

    factory :role_delivery_partner do
      name { "delivery_partner" }
    end
  end
end
