class Processing < ApplicationRecord
  belongs_to :equipment
  has_many :workings, dependent: :destroy
  has_many :working_users, through: :workings, source: :user
  has_many :flows, dependent: :destroy
  has_many :flow_prototypes, through: :flows, source: :prototype
end
