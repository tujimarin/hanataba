class CartItemsController < ApplicationController
  before_action :set_cart_items, only: [:index, :purchase, :update]
  before_action :set_cart_item, only: [:destroy]

  def index
    @items      = Item.all
    @cart_items = User.find(current_user.id).cart_items.where(status: 0)
  end

  def new
    @items = Item.all
  end

  def create
    cart_item_params.each_key do |id|
      User.find(current_user.id).cart_items.create(
        item_id: id.to_i,
        amount: cart_item_params[id],
        status: 0,
        change_status_date: Date.today
      )
    end

    redirect_to( { action: :index }, notice: 'カートに追加しました。')
  end

  def purchase
    @cart_items = User.find(current_user.id).cart_items.where(status: 0)
    @cart_items.each do |ci|
      ci.update(status: 1, change_status_date: Date.today)
    end

    redirect_to( current_user, notice: "以下の商品を発注しました。")
  end

  def destroy
    cart_item = Item.find(@cart_item.item_id).name
    @cart_item.destroy
    redirect_to cart_items_url, notice: "#{cart_item}を買い物カゴからキャンセルしました。"
  end

  private

  def set_cart_items
    @cart_items = User.find(current_user.id).cart_items.where(status: 0)
  end

  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end

  def cart_item_params
    params.require(:item).permit(Item.ids.map(&:to_s)).select { |k,v| v.to_i > 0 }
  end
end
