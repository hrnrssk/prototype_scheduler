FactoryBot.define do
  factory :prototype do
    order_number { '00000001' }
    customer { 'Apple' }
    name { 'Mac' }
    delivery_date { '2021/02/20'}
  end
end