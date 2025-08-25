# app/controllers/cart_items_controller.rb
class CartItemsController < ApplicationController
  skip_before_action :require_authentication, only: [ :create, :destroy, :update ]
  before_action :set_cart

  def create
    product_id = params.require(:product_id)
    qty        = params.fetch(:quantity, 1).to_i.clamp(1, 999)

    product = Product.find(product_id)
    if product.stock && qty > product.stock
      return redirect_back fallback_location: products_path, alert: "No hay stock suficiente."
    end

    @cart.add_product(product_id, qty)
    redirect_back fallback_location: products_path
  end


  def update
    item = @cart.cart_items.find(params[:id])
    qty  = params.require(:cart_item).permit(:quantity)[:quantity].to_i
    if qty <= 0
      item.destroy
    else
      # (opcional) validar stock
      if item.product.stock && qty > item.product.stock
        return redirect_to cart_path, alert: "No hay stock suficiente."
      end
      item.update!(quantity: qty, subtotal: item.unit_price * qty)
    end
    redirect_to cart_path
  end

  def destroy
    item = @cart.cart_items.find(params[:id])
    item.destroy
    redirect_to cart_path
  end

  private
  def set_cart
    @cart = current_cart
  end
end
