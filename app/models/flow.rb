class Flow < ApplicationRecord
  validates :number, numericality: { only_integer: true }, presence: true
  validate :date_before_scheduled_start
  validate :date_before_scheduled_end
  validate :date_before_end
  belongs_to :prototype, optional: true
  belongs_to :processing, optional: true
  has_many :assignings, dependent: :destroy
  has_many :assigning_users, through: :assignings, source: :user

  def date_before_scheduled_start
    return if scheduled_starting_time.blank?
    errors.add(:scheduled_starting_time, "は今日以降の日付を選択してください") if scheduled_starting_time < Date.today
  end

  def date_before_scheduled_end
    return if scheduled_ending_time.blank?
    errors.add(:scheduled_ending_time, "は今日以降の日付を選択してください") if scheduled_ending_time < Date.today
  end

  def date_before_end
    return if ending_time.blank?
    errors.add(:ending_time, "は今日以前の日付を選択してください") if ending_time > Date.today
  end

end
