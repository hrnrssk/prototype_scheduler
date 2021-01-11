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

  # def self.guest
  #   find_or_create_by!(name: 'guest', email: 'guest@example.com') do |user|
  #     user.password = SecureRandom.urlsafe_base64
  #     user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
  #   end
  # end
end
