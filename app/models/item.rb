class Item < ApplicationRecord
  # has_one :purchase
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :postage
  belongs_to :area
  belongs_to :shipping

  with_options presence: true do
    validates :name, :introduction, :category_id,
              :status_id, :postage_id, :area_id, :shipping_date_id, :image
    validates :category_id, :status_id, :postage_id, :area_id, :shipping_date_id,
              numericality: { other_than: 1, message: "can't be blank" }
    validates_inclusion_of :price, in: 300..9_999_999
    with_options format: { with: /\A[0-9]+\z/ } do
      validates :price
    end
  end
end
