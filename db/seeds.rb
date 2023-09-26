# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

# Roles:
Role.create(name: 'admin')
Role.create(name: 'customer')
Role.create(name: 'delivery_partner')

# Users:
user = User.new(username: "Admin", email: "admin@gmail.com", password: 'abc123', password_confirmation: 'abc123', type: "Admin")
user.add_role('admin')
user.save

user = DeliveryPartner.new(username: "Delivery Partner", email: "delivery_partner@gmail.com", password: 'abc123', password_confirmation: 'abc123', company_name: "Delivery partner1")
user.add_role('delivery_partner')
user.save

user = Customer.new(username: "Customer", email: "customer@gmail.com", password: 'abc123', password_confirmation: 'abc123')
user.add_role('customer')
user.save

# Packages:
packages_data = []

def package_detail(index)
  { package_name: "package #{index}", description: "Description for package #{index}", weight: 19.99 }
end

(1..20).each do |index|
  packages_data << package_detail(index)
end

packages_data.each do |data|
  Package.create(data)
end

