class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, uniqueness: true  
  validates :password, presence: true, allow_nil: true
  validates :name, presence: true
  validates :role, presence: true

  as_enum :role, admin: 0, products: 1, seller: 2

  has_and_belongs_to_many :products
  has_and_belongs_to_many :groups
end
