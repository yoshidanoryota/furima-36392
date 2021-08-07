class OrdersController < ApplicationController

  before_action :item_find, only: [:index, :create,]



  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    @item = Item.find(params[:item_id])
    params.require(:order_address).permit(:zip_code, :area_id, :city, :house_number, :building_name, :phone).merge(
      item_id: @item.id, user_id: current_user.id, token: params[:token]
    )
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = "sk_test_b2881392a093e23ea605240d"
    Payjp::Charge.create(
      amount: @item.price,  
      card: order_params[:token],  
      currency: 'jpy' 
    )
  end



end


