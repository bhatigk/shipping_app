class Shipment < ApplicationRecord
  belongs_to :package
  belongs_to :customer, class_name: "User", foreign_key: "customer_id"
  belongs_to :delivery_partner, class_name: "User", foreign_key: "delivery_partner_id"

  enum status: {
    pending: 0,
    in_transit: 1,
    delivered: 2,
    canceled: 3
  }

  %w(source_location target_location).each do |klass|
    define_method "fetch_#{klass}" do
      address = case klass
                when "source_location"
                  source_location
                when "target_location"
                  target_location
                end

      "#{address['street_address']} #{address['city']} #{address['state']} #{address['zip']}"
    end
  end
end
