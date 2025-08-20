# app/controllers/carts_controller.rb
class CartsController < ApplicationController
  skip_before_action :require_authentication, only: [ :show ]
  def show
    @cart = current_cart
  end
end
