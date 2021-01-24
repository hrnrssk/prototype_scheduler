require 'rails_helper'
RSpec.describe Equipment, type: :model do
  # 装置名とコメントがあれば有効な状態であること
  it "is valid with a name, comment" do
    equipment = Equipment.new(
        name: '装置',
        comment: 'ロボット')
    expect(equipment).to be_valid
  end
  # 装置名がなければ無効な状態であること
  # equipment.valid?メソッドを実行し、失敗すると、equipmentインスタンスの中にエラーメッセージが入ること
  it "is invalid without a name" do
    equipment = Equipment.new(name: nil)
    equipment.valid?
    expect(equipment.errors[:name]).to include("を入力してください")
  end
  # 重複した装置名なら無効な状態であること
  it "is invalid with a duplicate name" do
    Equipment.create(
      name: '装置',
      comment: 'ロボット')
    equipment = Equipment.new(
      name: '装置',
      comment: 'ROBOT')
    equipment.valid?
    expect(equipment.errors[:name]).to include("はすでに存在します")
  end
  # 装置名が21文字以上なら無効な状態であること
  it "is invalid with name is 21 or more characters" do
    equipment = Equipment.new(name: 'a' * 21)
    equipment.valid?
    expect(equipment.errors[:name]).to include("は20文字以内で入力してください")
  end
    # コメントが21文字以上なら無効な状態であること
  it "is invalid with comment is 21 or more characters" do
    equipment = Equipment.new(comment: 'a' * 21)
    equipment.valid?
    expect(equipment.errors[:comment]).to include("は20文字以内で入力してください")
  end
end