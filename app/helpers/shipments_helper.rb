module ShipmentsHelper
  def shipment_status_options
    Shipment.statuses.keys.map { |status| [status.titleize, status] }
  end

  def packages_options
    Package.includes(:shipment).where(shipment: { id: nil }).order(created_at: :asc).map { |package| [package.package_name.titleize, package.id] }
  end

  def delivery_partner_options
    DeliveryPartner.all.map { |delivery_partner| [delivery_partner.company_name, delivery_partner.id] }
  end
end
