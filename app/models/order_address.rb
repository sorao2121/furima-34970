class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id ,:postal_code, :postage_type, :city, :house_number, :building_name, :phone_number, :order_id

  validates :postage_type, numericality: { other_than: 1, message: "can't be blank"}

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :house_number
    validates :phone_number
  end
    validates :postage_type, numericality: {other_than: 0, message: "can't be blank"}

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, postage_type: postage_type, city: city, house_number: house_number, building_name: building_name, order_id: order.id)
  end
end