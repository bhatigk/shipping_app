class Package < ApplicationRecord
  has_one :shipment

  validates :package_name, presence: true, uniqueness: true
  validates :description, presence: true
end
