class Equipment < ApplicationRecord
  validates :name, uniqueness: true, length: { maximum: 20 }, presence: true
  validates :comment, length: { maximum: 20 }, presence: true
  has_many :processings, dependent: :destroy
end
