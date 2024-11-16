class Item < ApplicationRecord
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery
  belongs_to :user
  has_one_attached :image

  validates :name, :info, :category_id, :sales_status_id, :shipping_fee_status_id,
            :prefecture_id, :scheduled_delivery_id, :price, presence: true
end
