class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :role
  has_one :address, as: :addressable
  accepts_nested_attributes_for :address, allow_destroy: true
  has_one_attached :avatar

  def admin?
    role.try(:name) == 'admin'
  end
end
