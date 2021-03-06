require 'rails_helper'
RSpec.describe Flow, type: :model do
  # 工程NOがあれば有効な状態であること
  it "is valid with a number" do
    flow = Flow.new(
        number: '1',
        processing_id: '1',
        user_id: '1',
        scheduled_starting_time: '2100-01-20 00:00',
        scheduled_ending_time: '2100-01-21 00:00',
        ending_time: '2021-01-20 00:00')
    expect(flow).to be_valid
  end
  # 工程NOがなければ無効な状態であること
  # flow.valid?メソッドを実行し、失敗すると、flowインスタンスの中にエラーメッセージが入ること
  it "is invalid without a number" do
    flow = Flow.new(number: nil)
    flow.valid?
    expect(flow.errors[:number]).to include("を入力してください")
  end
  # 工程NOが整数でなければ無効な状態であること
  it "is invalid without a integer" do
    flow = Flow.new(number: '１')
    flow.valid?
        expect(flow.errors[:number]).to include("は数値で入力してください")
  end
  # 開始予定と終了予定が本日以前であれば無効な状態であること
  # flow.valid?メソッドを実行し、失敗すると、flowインスタンスの中にエラーメッセージが入ること
  it "is invalid without integrity of date" do
    flow = Flow.new(
      number: '1',
      processing_id: '1',
      user_id: '1',
      scheduled_starting_time: '2021-01-20 00:00',
      scheduled_ending_time: '2021-01-20 00:00',
      ending_time: '2100-02-20 00:00')
    flow.valid?
    expect(flow.errors[:scheduled_starting_time]).to include("は本日以降の日付を選択してください")
    expect(flow.errors[:scheduled_ending_time]).to include("は本日以降の日付を選択してください")
    expect(flow.errors[:ending_time]).to include("は本日以前の日付を選択してください")
  end
  # processin_idとuser_idが空欄であれば無効な状態であること
  # flow.valid?メソッドを実行し、失敗すると、flowインスタンスの中にエラーメッセージが入ること
  it "is invalid without processing_id and user_id" do
    flow = Flow.new(
      number: '1',
      processing_id: '',
      user_id: '',
      scheduled_starting_time: '2100-01-20 00:00',
      scheduled_ending_time: '2100-01-21 00:00',
      ending_time: '2021-01-20 00:00')
    flow.valid?
    expect(flow.errors[:processing_id]).to include("を入力してください")
    expect(flow.errors[:user_id]).to include("を入力してください")
  end
end