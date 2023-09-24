class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  has_many :user_roles
  has_many :roles, through: :user_roles

  def add_role(role_name)
    role = Role.find_by(name: role_name)
    roles << role if role.present?
  end

  def role?(role_name)
    roles.exists?(name: role_name)
  end
end
