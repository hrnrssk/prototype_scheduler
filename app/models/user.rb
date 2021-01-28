class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :authentication_keys => [:name]

  validates :name, uniqueness: true, length: { maximum: 20 }, presence: true
  validates :email, uniqueness: true, presence: true
  has_many :workings, dependent: :destroy
  has_many :working_processings, through: :workings, source: :processing
  has_many :assignings, dependent: :destroy
  has_many :assigning_flows, through: :assignings, source: :flow
  accepts_nested_attributes_for :workings, allow_destroy: true

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      #認証の条件式を変更する
      where(conditions).where(["name = :value", { :value => name }]).first
    else
      where(conditions).first
    end
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def self.guest
    find_or_create_by!(name: 'guest', email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
  end
end
