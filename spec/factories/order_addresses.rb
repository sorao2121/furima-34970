FactoryBot.define do
  factory :order_address do
    # association :user
    # association :item

    item_id { 1 }
    user_id { 1 }
    postal_code { "123-4567" }
    postage_type_id { 2 }
    city { "横浜市緑区" }
    house_number { "青山1-1-1" }
    building_name { "柳ビル103" }
    phone_number { "09012345678" }

    order { 1 }
  end
end