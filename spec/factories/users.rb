FactoryBot.define do
  factory :user do
    username { Faker::Name.name }
    email    { Faker::Internet.email }
    password { "password" }
    phone_number { Faker::PhoneNumber.cell_phone }

    transient do
      after(:build) do |user|
        FactoryBot.create(:role_customer)
        user.add_role :customer
      end
    end
  end
end
