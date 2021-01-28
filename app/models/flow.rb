class Flow < ApplicationRecord
  validates :number, numericality: { only_integer: true }, presence: true
  validate :scheduled_start_date
  validate :scheduled_end_date
  validate :end_date
  belongs_to :prototype, optional: true
  belongs_to :processing, optional: true
  has_many :assignings, dependent: :destroy
  has_many :assigning_users, through: :assignings, source: :user

  def scheduled_start_date
    return if scheduled_starting_time.blank?
    errors.add(:scheduled_starting_time, "は本日以降の日付を選択してください") if scheduled_starting_time < Date.today
  end

  def scheduled_end_date
    return if scheduled_ending_time.blank?
    errors.add(:scheduled_ending_time, "は本日以降の日付を選択してください") if scheduled_ending_time < Date.today
    errors.add(:scheduled_ending_time, "は開始予定以降の日付を選択してください") if scheduled_ending_time < scheduled_starting_time
  end

  def end_date
    return if ending_time.blank?
    errors.add(:ending_time, "は本日以前の日付を選択してください") if ending_time > Date.today
  end

end
