class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :find_item, only: [:show, :edit, :update]
  before_action :edit_item, only: [:edit, :update]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end 

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end
end

private
def item_params
  params.require(:item).permit(:image, :name, :description, :category_id, :item_condition_id, :postage_pay_id, :postage_type_id,
                           :delivery_day_id, :price).merge(user_id: current_user.id)
end

def find_item
  @item = Item.find(params[:id])
end

def edit_item
  redirect_to root_path unless current_user.id == @item.user_id
end