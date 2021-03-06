class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :item_condition
  belongs_to :postage_pay
  belongs_to :postage_type
  belongs_to :delivery_day
  has_one_attached :image
  has_one :order

  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :description, length: { maximum: 1000 }
    validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :item_condition_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :postage_pay_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :postage_type_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :delivery_day_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :price
  end
  validates :price, numericality: { with: /\A[0-9]+\z/, message: 'には半角数字を使用してください' }
  validates_inclusion_of :price, { in: 300..9_999_999, message: '金額範囲内で入力してください' }
end
