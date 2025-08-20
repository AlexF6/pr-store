# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  include Authentication
  helper_method :current_cart

  private

  def current_cart
    Cart.find_by(id: session[:cart_id]) || create_cart
  end

  private

  def create_cart
    cart = Cart.create!
    session[:cart_id] = cart.id
    cart
  end


  allow_browser versions: :modern
end
