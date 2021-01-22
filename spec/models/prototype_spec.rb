require 'rails_helper'
RSpec.describe Prototype, type: :model do
  # 注文番号と得意先と品名と納期があれば有効な状態であること
  it "is valid with a order_number, customer, name, delivery_date" do
    prototype = Prototype.new(
        order_number: '00000001',
        customer: 'Apple',
        name: 'Mac',
        delivery_date: '2021/02/01')
    expect(prototype).to be_valid
  end
  # 注文番号と得意先と品名と納期がなければ無効な状態であること
  # prototype.valid?メソッドを実行し、失敗すると、prototypeインスタンスの中にエラーメッセージが入ること
  it "is invalid without a order_number" do
    prototype = Prototype.new(
        order_number: nil,
        customer: 'Apple',
        name: 'Mac',
        delivery_date: '2021/02/01')
    prototype.valid?
    expect(prototype.errors[:order_number]).to include("を入力してください")
  end
  it "is invalid without a customer" do
    prototype = Prototype.new(
        order_number: '00000001',
        customer: nil,
        name: 'Mac',
        delivery_date: '2021/02/01')
    prototype.valid?
    expect(prototype.errors[:customer]).to include("を入力してください")
  end
  it "is invalid without a name" do
    prototype = Prototype.new(
        order_number: '00000001',
        customer: 'Apple',
        name: nil,
        delivery_date: '2021/02/01')
    prototype.valid?
    expect(prototype.errors[:name]).to include("を入力してください")
  end
  it "is invalid without a delivery_date" do
    prototype = Prototype.new(
        order_number: '00000001',
        customer: 'Apple',
        name: 'Mac',
        delivery_date: nil)
    prototype.valid?
    expect(prototype.errors[:delivery_date]).to include("を入力してください")
  end
  # 重複した注文番号なら無効な状態であること
  it "is invalid with a duplicate name" do
    Prototype.create(
        order_number: '00000001',
        customer: 'Apple',
        name: 'Mac',
        delivery_date: '2021/02/01')
    prototype = Prototype.new(
        order_number: '00000001',
        customer: 'Peach',
        name: 'Macbook',
        delivery_date: '2021/02/02')
    prototype.valid?
    expect(prototype.errors[:order_number]).to include("はすでに存在します")
  end
  # 注文番号が8文字以外なら無効な状態であること
  it "is invalid with order_number is 8 characters" do
    prototype = Prototype.new(order_number: 'a' * 9)
    prototype.valid?
    expect(prototype.errors[:order_number]).to include("は8文字で入力してください")
  end
  # 得意先が21文字以上なら無効な状態であること
  it "is invalid with name is 21 or more characters" do
    prototype = Prototype.new(customer: 'a' * 21)
    prototype.valid?
    expect(prototype.errors[:customer]).to include("は20文字以内で入力してください")
  end
  # 品名が31文字以上なら無効な状態であること
  it "is invalid with name is 31 or more characters" do
    prototype = Prototype.new(name: 'a' * 31)
    prototype.valid?
    expect(prototype.errors[:name]).to include("は30文字以内で入力してください")
  end
end