class CartController < ApplicationController

  def index
    session[:cart_item]         = params[:item]
    session[:cart_item]       ||= Hash.new { |k,v| k[v] = {} }
    @items                      = Item.where(id: session[:cart_item]["id"].select { |k,v| v == "1" }.keys ) 

  end

  def edit
    session[:cart_item]["id"] ||= Hash.new { |k,v| k[v] = {} }
    @items                      = Item.where(id: session[:cart_item]["id"].select { |k,v| v == "1" }.keys ) 

  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
