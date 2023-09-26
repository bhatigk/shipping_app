FactoryBot.define do
  factory :delivery_partner do
    username { Faker::Name.name }
    email    { Faker::Internet.email }
    password { "password" }
    type { "delivery_partner" }
    phone_number { Faker::PhoneNumber.cell_phone }

    transient do
      after(:build) do |user|
        FactoryBot.create(:role_delivery_partner)
        user.add_role :delivery_partner
      end
    end
  end
end
