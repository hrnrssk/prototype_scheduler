class Flow < ApplicationRecord
  belongs_to :prototype, optional: true
  belongs_to :processing, optional: true
  has_many :assignings, dependent: :destroy
  has_many :assigning_users, through: :assignings, source: :user
end
