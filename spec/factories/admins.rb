FactoryBot.define do
  factory :admin do
    username { Faker::Name.name }
    email    { Faker::Internet.email }
    password { "password" }
    type { "admin" }
    phone_number { Faker::PhoneNumber.cell_phone }

    transient do
      after(:build) do |user|
        FactoryBot.create(:role_admin)
        user.add_role :admin
      end
    end
  end
end
