require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  context '商品の登録ができるとき' do
    it '商品情報が存在すれば登録できること' do
      expect(@item).to be_valid
    end
  end

  context '商品の登録ができないとき' do
    it 'imageが空だと出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it '商品名が空では登録できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it '商品の説明が空では登録できない' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it 'カテゴリーの情報が未選択では登録できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it '商品の状態についての情報が未選択では登録できない' do
      @item.item_condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Item condition can't be blank")
    end
    it '配送料の負担についての情報が未選択では登録できない' do
      @item.postage_pay_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Postage pay can't be blank")
    end
    it '発送元のにつ地域についての情報が未選択では登録できない' do
      @item.postage_type_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Postage type can't be blank")
    end
    it '発送までの日数が未選択では登録できない' do
      @item.delivery_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery day can't be blank")
    end
    it '販売価格の情報が空では登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it '販売価格は、¥300~¥9999999の間のみで保存可能であること' do
      @item.price = 200
      @item.valid?
      expect(@item.errors.full_messages).to include('Price 金額範囲内で入力してください')
    end
    it '販売価格は、¥300~¥9999999の間のみで保存可能であること' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price 金額範囲内で入力してください')
    end
    it '販売価格は半角数字のみ保存可能であること' do
      @item.price = '１０００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price には半角数字を使用してください')
    end
    it '販売価格は半角英数字混合では出品できない' do
      @item.price = '123abc'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price には半角数字を使用してください')
    end
    it '販売価格は半角英字のみでは出品できない' do
      @item.price = 'abcdefg'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price には半角数字を使用してください')
    end
    it '販売価格は全角文字では出品できない' do
      @item.price = '１０００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price には半角数字を使用してください')
    end
    it 'ユーザーが紐付いていなければ投稿できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end
  end
end
