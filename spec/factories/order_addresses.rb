FactoryBot.define do
  factory :order_address do
    #  association :user
    #  association :item

    user_id { 1 }
    item_id { 1 }
    postal_code { "123-4567" }
    postage_type_id { 2 }
    city { "横浜市緑区" }
    house_number { "青山1-1-1" }
    building_name { "柳ビル103" }
    phone_number { "09012345678" }
    token {"tok_abcdefghijk00000000000000000"}

    order { 1 }
  end
end