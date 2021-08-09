class OrdersController < ApplicationController
  before_action :item_find, only: [:index, :create]
  before_action :move_to_root, only: [:index, :create]
  before_action :authenticate_user!

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
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    item = Item.find(params[:id])
    redirect_to action: :index unless current_user.id == item.user_id
  end

  def move_to_root
    item = Item.find(params[:item_id])
    if item.order.present?
      redirect_to root_path
    elsif user_signed_in? && current_user.id == item.user.id
      redirect_to root_path
    end
  end
end
