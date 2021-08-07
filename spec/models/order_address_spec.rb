require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  context '商品の購入ができるとき' do
    it '商品情報が存在すれば登録できること' do
      expect(@order_address).to be_valid
    end
  end

  context '商品の購入ができないとき' do 
    it '郵便番号が空では登録できない' do
      @order_address.postal_code = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it '郵便番号の保存にはハイフンがなければ登録できない' do
      @order_address.postal_code = '1234567'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it '都道府県が空では登録できない' do
      @order_address.postage_type_id = 1
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postage type can't be blank")
    end
    it '市区町村が空では登録できない' do
      @order_address.city = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end
    it '電話番号が空では登録できない' do
      @order_address.phone_number = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号は11桁以内の数値のみ保存可能なこと' do
      @order_address.phone_number = '123456789012'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
    end
  end
end