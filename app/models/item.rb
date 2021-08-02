class Item < ApplicationRecord

  has_one :purchase
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :status, :postage, :area, :shipping

  with_options presence: true do
    validates :name, :price, :introduction, :user, :category_id,
              :status_id, :postage_id, :area_id, :shipping_date_id
  end

  validates :category_id, :status_id, :postage_id, :area_id, :shipping_date_id,
             numericality: { other_than: 1 , message: "can't be blank"}

end

