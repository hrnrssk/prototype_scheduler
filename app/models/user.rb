class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates :name, presence: true
  has_many :workings, dependent: :destroy
  has_many :working_processings, through: :workings, source: :processing
  accepts_nested_attributes_for :workings, allow_destroy: true
end
