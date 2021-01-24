FactoryBot.define do
  factory :processing do
    name { 'テスト工程(テスト機)' }
    comment { 'テストする工程' }
    time_required { '01:00' }
    equipment_id { '2' }
  end
end