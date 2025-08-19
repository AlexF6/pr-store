# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  include Authentication
  helper_method :current_cart

  private

  def current_cart
    if Current.user
      # Si hay carrito en sesión, fusiónalo con el del usuario
      if session[:cart_id] && (guest_cart = Cart.open.find_by(id: session[:cart_id]))
        user_cart = Current.user.cart || Current.user.carts.open.first || Current.user.carts.create!
        merge_carts!(guest_cart, user_cart)
        session.delete(:cart_id)
        return user_cart
      end
      Current.user.cart || Current.user.carts.open.first || Current.user.carts.create!
    else
      Cart.open.find_by(id: session[:cart_id]) || begin
        cart = Cart.create!
        session[:cart_id] = cart.id
        cart
      end
    end
  end

  def merge_carts!(from, to)
    return to if from == to
    from.cart_items.find_each do |item|
      to.add_product(item.product_id, item.quantity)
    end
    from.update!(status: "merged")
    to
  end

  allow_browser versions: :modern
end
