class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  has_many :user_roles, dependent: :destroy
  has_many :roles, through: :user_roles
  has_many :shipments

  def add_role(role_name)
    role = Role.find_by(name: role_name)
    roles << role if role.present?
  end

  %w(admin customer delivery_partner).each do |klass|
    define_method "#{klass}?" do
      roles.exists?(name: klass)
    end
  end
end
