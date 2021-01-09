class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates :name, presence: true
  has_many :workings, dependent: :destroy
  has_many :working_processings, through: :workings, source: :processing
  has_many :assignings, dependent: :destroy
  has_many :assigning_flows, through: :assignings, source: :flow
  accepts_nested_attributes_for :workings, allow_destroy: true
end
