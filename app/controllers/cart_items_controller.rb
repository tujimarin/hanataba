class CartItemsController < ApplicationController

  def index
    @items      = Item.all
    @cart_items = User.find(current_user.id).cart_items.where(status: 0)
  end

  def show
  end

  def new
    @items = Item.all
  end

  def edit
  end

  def create
    set_cart_items.each_key do |id|
      User.find(current_user.id).cart_items.create(
        item_id: id.to_i,
        amount: set_cart_items[id],
        status: 0,
        change_status_date: Date.today
      )
    end

    redirect_to( { action: :index }, notice: 'カートに追加しました。')
  end

  def purchase
    @cart_items = User.find(current_user.id).cart_items.where(status: 0)
    @cart_items.each do |ci|
      ci.update(status: 1)
    end

    redirect_to( current_user, notice: "以下の商品を発注しました。")
  end

  def update
    if @cart_item.update(cart_item_params)
      redirect_to @cart_item, notice: 'Cart item was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @cart_item.destroy
    redirect_to cart_items_url, notice: 'Cart item was successfully destroyed.'
  end

  private

  def set_cart_items
    params.require(:item).permit(Item.ids.map(&:to_s)).select { |k,v| v.to_i > 0 }
  end
end
