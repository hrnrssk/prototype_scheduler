class Processing < ApplicationRecord
  validates :name, length: { maximum: 20 }, presence: true
  validates :comment, length: { maximum: 20 }, presence: true
  belongs_to :equipment
  has_many :workings, dependent: :destroy
  has_many :working_users, through: :workings, source: :user
  # has_many :flows, dependent: :destroy
  has_many :flows
  has_many :flow_prototypes, through: :flows, source: :prototype
  accepts_nested_attributes_for :flows, allow_destroy: true
end
