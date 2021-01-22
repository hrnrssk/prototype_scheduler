require 'rails_helper'
RSpec.describe Processing, type: :model do
  # 工程名とコメントがあれば有効な状態であること
  it "is valid with a name, comment" do
    Equipment.create(
        id: '1',
        name: '装置',
        comment: 'ロボット')
    processing = Processing.new(
        name: '工程',
        comment: 'プロセス',
        equipment_id: '1')
    expect(processing).to be_valid
  end
  # 工程名がなければ無効な状態であること
  # processing.valid?メソッドを実行し、失敗すると、processingインスタンスの中にエラーメッセージが入ること
  it "is invalid without a name" do
    processing = Processing.new(name: nil)
    processing.valid?
    expect(processing.errors[:name]).to include("を入力してください")
  end
  # 重複した工程名なら無効な状態であること
  it "is invalid with a duplicate name" do
    Equipment.create(
        id: '1',
        name: '装置',
        comment: 'ロボット')
    Processing.create(
      equipment_id: '1',
      name: '工程',
      comment: 'プロセス',
      time_required: '00:30')
    processing = Processing.new(
      name: '工程',
      comment: 'PROCESS')
    processing.valid?
    expect(processing.errors[:name]).to include("はすでに存在します")
  end
  # 工程名が21文字以上なら無効な状態であること
  it "is invalid with name is 21 or more characters" do
    processing = Processing.new(name: 'a' * 21)
    processing.valid?
    expect(processing.errors[:name]).to include("は20文字以内で入力してください")
  end
    # コメントが21文字以上なら無効な状態であること
  it "is invalid with comment is 21 or more characters" do
    processing = Processing.new(comment: 'a' * 21)
    processing.valid?
    expect(processing.errors[:comment]).to include("は20文字以内で入力してください")
  end
end