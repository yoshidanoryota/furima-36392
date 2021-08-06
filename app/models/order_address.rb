class OrderAddress
  include ActiveModel::Model
  attr_accessor :zip_code, :area_id, :city, :house_number, :building_name, :phone,
                :item_id, :user_id

  with_options presence: true do
    validates :area_id, :city, :house_number, :item_id, :user_id, :phone, :zip_code

    validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(zip_code: zip_code, area_id: area_id, city: city, house_number: house_number, building_name: building_name, phone: phone, order_id: order.id)
  end



end

# building_nameは任意のためバリデーション不要
#:card_number, :card_month, :card_year, :card_cvc,
#card_number:card_number,card_month:card_month,card_year:card_year,card_cvc:card_cvc,