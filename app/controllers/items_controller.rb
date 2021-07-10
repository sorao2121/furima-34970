class ItemsController < ApplicationController
  def index
    @items = Item.all
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end 
end

private

def item_params
  params.require(:item).permit(:image, :name, :description, :category_id, :item_condition_id, :postage_pay_id, :postage_type_id,
                           :delivery_day_id, :price).merge(user_id: current_user.id)
end
