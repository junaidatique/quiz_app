class Quiz < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :group

  validates :title, presence: true
  validates :product, presence: true
  validates :group, presence: true
end
