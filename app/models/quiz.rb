class Quiz < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :group

  has_many :answers
  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true


  validates :title, presence: true
  validates :product, presence: true
  validates :group, presence: true
  
end
