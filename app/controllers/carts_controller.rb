class CartsController < ApplicationController
  before_action :authenticate_user!
 
  def show
    cart_ids = $redis.smembers current_user_cart
    @cart_product = Movie.find(cart_ids)
  end
 
  def add
    $redis.sadd current_user_cart, params[:product_id]
    render json: current_user.cart_count, status: 200
  end
 
  def remove
    $redis.srem current_user_cart, params[:product_id]
    render json: current_user.cart_count, status: 200
    redirect_to products_path(params[:product_id])
  end
 
  private
 
  def current_user_cart
    "cart#{current_user.id}"
  end
end