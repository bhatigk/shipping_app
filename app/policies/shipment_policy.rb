class ShipmentPolicy < ApplicationPolicy
  def new?
    user.admin? or user.customer?
  end

  def create?
    user.admin? or user.customer?
  end

  def edit?
    user.admin? or user.delivery_partner?
  end

  def update?
    user.admin? or user.delivery_partner?
  end

  def destroy?
    user.admin?
  end
end
