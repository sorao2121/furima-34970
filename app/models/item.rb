class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions 
  belongs_to :user
  belongs_to :category
  belongs_to :item_condition
  belongs_to :postage_pay
  belongs_to :postage_type
  belongs_to :delivery_day
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :description
    validates :category_id, numericality: { other_than: 1 }
    validates :item_condition_id, numericality: { other_than: 1 }
    validates :postage_pay_id, numericality: { other_than: 1 }
    validates :postage_type_id, numericality: { other_than: 1 }
    validates :delivery_day_id, numericality: { other_than: 1 }
    validates :price
  end
end

