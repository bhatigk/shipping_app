class PackagePolicy < ApplicationPolicy
  def new?
    user.admin? or user.customer?
  end

  def create?
    user.admin? or user.customer?
  end

  def edit?
    user.admin?
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end
end
