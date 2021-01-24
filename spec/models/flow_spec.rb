require 'rails_helper'
RSpec.describe Flow, type: :model do
  # 工程NOがあれば有効な状態であること
  it "is valid with a number" do
    flow = Flow.new(
        number: '1',)
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
end