class Prototype < ApplicationRecord
  validates :order_number, length: { is: 8 }, presence: true
  validates :customer, length: { maximum: 20 }, presence: true
  validates :name, length: { maximum: 30 }, presence: true
  validates :delivery_date, presence: true

  has_many :flows, dependent: :destroy
  has_many :flow_processings, through: :flows, source: :processing
end
