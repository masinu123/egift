class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_roles
  has_many :roles, through: :user_roles, source: :role
  has_many :permissions, through: :roles, source: :permissions

  has_many :product_manages
  has_many :products, through: :product_manages, source: :product

  has_many :cards

  accepts_nested_attributes_for :products

  def super_admin?
    role_codes.include?('super_admin')
  end

  def client?
    role_codes.size == 1 && role_codes[0] == 'client'
  end

  def role_codes
    @role_codes ||= roles.map(&:code)
  end

  def role_names
    @role_names ||= roles.map(&:name)
  end
end
