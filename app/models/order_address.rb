class OrderAddress
  include ActiveModel::Model
  attr_accessor :zip_code, :area_id, :city, :house_number, :building_name, :phone, :item_id, :user_id, :token

  with_options presence: true do
    validates :area_id, :city, :house_number, :item_id, :user_id, :token

    validates :area_id, numericality: { other_than: 1, message: "can't be blank" }

    with_options format: { with: /\A[0-9]{3}-[0-9]{4}\z/ } do
      validates :zip_code
    end

    with_options format: { with: /\A[0-9]{10,11}\z/ } do
      validates :phone
    end
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(zip_code: zip_code, area_id: area_id, city: city, house_number: house_number, building_name: building_name,
                   phone: phone, order_id: order.id)
  end
end

# building_nameバリデーション不要
