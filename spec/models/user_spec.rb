require 'rails_helper'
RSpec.describe User, type: :model do
  # ユーザー名とemailとパスワードがあれば有効な状態であること
  it "is valid with a name, email, password" do
    user = User.new(
        name: '山田',
        email: 'example@example.com',
        password: 'password')
    expect(user).to be_valid
  end
  # ユーザー名がなければ無効な状態であること
  # user.valid?メソッドを実行し、失敗すると、userインスタンスの中にエラーメッセージが入ること
  it "is invalid without a name" do
    user = User.new(name: nil)
    user.valid?
    expect(user.errors[:name]).to include("を入力してください")
  end
  # 重複したユーザー名なら無効な状態であること
  it "is invalid with a duplicate name" do
    User.create(
      name: '山田',
      email: 'example@example.com',
      password: 'password',
      confirmed_at: Time.now)
    user = User.new(
      name: '山田',
      email: 'example2@example.com',
      password: 'password2')
    user.valid?
    expect(user.errors[:name]).to include("はすでに存在します")
  end
  # ユーザー名が21文字以上なら無効な状態であること
  it "is invalid with name is 21 or more characters" do
    user = User.new(name: 'a' * 21)
    user.valid?
    expect(user.errors[:name]).to include("は20文字以内で入力してください")
  end
end