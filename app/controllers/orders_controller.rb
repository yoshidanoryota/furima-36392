class OrdersController < ApplicationController
  before_action :item_find
  before_action :authenticate_user!
  before_action :move_to_root
  

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
    params.require(:order_address).permit(:zip_code, :area_id, :city, :house_number, :building_name, :phone).merge(
      item_id: @item.id, user_id: current_user.id, token: params[:token]
    )
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end


  def move_to_root
    if @item.order.present?
      redirect_to root_path
    elsif current_user.id == @item.user.id
      redirect_to root_path
    end
  end
end
