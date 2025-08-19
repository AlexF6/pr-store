class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  validates :quantity, numericality: { only_integer: true, greater_than: 0 }

  before_validation :set_prices

  private
  def set_prices
    self.unit_price ||= product&.price || 0
    self.subtotal    = unit_price.to_d * quantity.to_i
  end
end
