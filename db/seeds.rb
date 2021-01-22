10.times do |n|
    name = Faker::Name.last_name
    email = Faker::Internet.email
    password = "password"
    User.create!(name: name,
                 email: email,
                 password: password,
                 password_confirmation: password,
                 confirmed_at: Time.now
                 )
end

20.times do |n|
    order_number = Faker::Number.leading_zero_number(digits: 8)
    customer = Faker::Company.name
    name = Faker::Food.fruits
    delivery_date = Faker::Date.between(from: 2.days.ago, to: 2.month.from_now)
    Prototype.create!(order_number: order_number,
                customer: customer,
                name: name,
                delivery_date: delivery_date,
                 )
end

Equipment.create(id: '1', name: '描画機',comment: '材料にパターンを刻印する装置')
Equipment.create(id: '2',name: '現像機',comment: '現像する装置')
Equipment.create(id: '3',name: 'ドライエッチング装置',comment: 'プラズマを照射して材料を削る装置')
Equipment.create(id: '4',name: 'カッター',comment: '材料を切断する装置')
Equipment.create(id: '5',name: 'プレス機',comment: '圧力をかけて加工する装置')
Equipment.create(id: '6',name: '鋳造装置',comment: '溶かした材料を流し込んで成形する装置')
Equipment.create(id: '7',name: '鍛造装置',comment: '熱で柔らかくなった材料に圧力をかけて成形する装置')
Equipment.create(id: '8',name: '電子顕微鏡',comment: '電子線を利用した顕微鏡')
Equipment.create(id: '9',name: '外観検査機',comment: '欠陥を検査する装置')
Equipment.create(id: '10',name: '梱包装置',comment: '梱包する装置')

Processing.create(id: '1',name: '描画',comment: '材料にパターンを描画する工程',time_required: '10:00',equipment_id: '1')
Processing.create(id: '2',name: 'レーザーマーキング',comment: 'レーザーマーカーでパターンを上書き消去する工程',time_required: '1:00',equipment_id: '1')
Processing.create(id: '3',name: '現像',comment: '現像処理で樹脂を溶かす工程',time_required: '00:30',equipment_id: '2')
Processing.create(id: '4',name: 'レジストエッチング',comment: 'プラズマで樹脂を削る工程',time_required: '00:20',equipment_id: '3')
Processing.create(id: '5',name: 'シリコンエッチング',comment: 'プラズマでシリコンを削る工程',time_required: '00:40',equipment_id: '3')
Processing.create(id: '6',name: '切断',comment: '材料を切断する工程',time_required: '00:30',equipment_id: '4')
Processing.create(id: '7',name: 'プレス加工',comment: '圧力をかけて材料を加工する工程',time_required: '01:00',equipment_id: '5')
Processing.create(id: '8',name: '鋳造',comment: '材料を型に流し込んで成形する工程',time_required: '06:00',equipment_id: '6')
Processing.create(id: '9',name: '鍛造',comment: '材料に圧力をかけて成形する工程',time_required: '03:00',equipment_id: '7')
Processing.create(id: '10',name: '寸法計測',comment: '電子顕微鏡で寸法を計測する工程',time_required: '02:00',equipment_id: '8')
Processing.create(id: '11',name: '欠陥観察',comment: '電子顕微鏡で欠陥を観察する工程',time_required: '03:00',equipment_id: '8')
Processing.create(id: '12',name: '外観検査',comment: '外観検査機で欠陥を検査する工程',time_required: '05:00',equipment_id: '9')
Processing.create(id: '13',name: '出荷',comment: '梱包して出荷する工程',time_required: '00:30',equipment_id: '10')

workings_list = []
User.all.ids.sort.each do |user_id|
  Processing.all.each do |processing|
    if rand(2) == 0
      workings_list << { user_id: user_id, processing_id: processing.id }
    end
  end
end
Working.create!(workings_list)











