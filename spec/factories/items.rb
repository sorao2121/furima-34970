FactoryBot.define do
  factory :item do
    association :user
    
    name { "商品名" }
    description { "商品説明" }
    category_id { 2 }
    item_condition_id { 2 }
    postage_pay_id { 2 }
    postage_type_id { 2 }
    delivery_day_id { 2 }
    price {10000}

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end