class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :postage_type_id, :city, :house_number, :building_name, :phone_number, :token

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :house_number
    validates :phone_number,length: { maximum: 11 }, format: {with: /\A\d{11}\z/, message: "is invalid. Input correctly"}
    validates :token
  end
  validates :postage_type_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, postage_type_id: postage_type_id, city: city, house_number: house_number,
                   building_name: building_name,phone_number: phone_number,order_id: order.id)
  end
end
