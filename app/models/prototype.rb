class Prototype < ApplicationRecord
  validates :order_number, uniqueness: true, length: { is: 8 }, presence: true
  validates :customer, length: { maximum: 20 }, presence: true
  validates :name, length: { maximum: 30 }, presence: true
  validates :delivery_date, presence: true
  validate :delivery_date_before_today
  has_many :flows, dependent: :destroy
  has_many :flow_processings, through: :flows, source: :processing

  def delivery_date_before_today
    errors.add(:delivery_date, "は今日以降の日付を選択してください") if delivery_date < Date.today
  end
end
