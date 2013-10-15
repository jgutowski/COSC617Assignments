class ApplicationController < ActionController::Base
  include ActionView::Helpers::NumberHelper
  protect_from_forgery
  helper_method :TestTime
  
  private
  
  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end
  
  private

  before_filter :initialize_session

  def initialize_session
  # Called before any controller method
    session[:store_index_count] ||= 0
  end

# ...


  
  
  
end
