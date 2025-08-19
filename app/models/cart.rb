class Cart < ApplicationRecord
  belongs_to :user, optional: true
  has_many :cart_items, dependent: :destroy

  scope :open, -> { where(status: "open") }

  def total
    cart_items.sum(:subtotal)
  end

  def add_product(product_id, qty = 1)
    product = Product.find(product_id)
    item = cart_items.find_or_initialize_by(product: product)
    item.quantity = (item.quantity || 0) + qty
    item.unit_price = product.price
    item.subtotal   = item.unit_price * item.quantity
    item.save!
    item
  end
end
