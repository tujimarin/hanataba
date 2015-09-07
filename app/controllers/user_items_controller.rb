class UserItemsController < ApplicationController
  before_action :set_user_item, only: [:show, :edit, :update, :destroy]

  # GET /user_items
  def index
    @user_items = UserItem.all
  end

  # GET /user_items/1
  def show
  end

  # GET /user_items/new
  def new
    @user_item = UserItem.new
  end

  # GET /user_items/1/edit
  def edit
  end

  # POST /user_items
  def create
    @user_item = UserItem.new(user_item_params)

    if @user_item.save
      redirect_to @user_item, notice: 'User item was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /user_items/1
  def update
    if @user_item.update(user_item_params)
      redirect_to @user_item, notice: 'User item was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /user_items/1
  def destroy
    @user_item.destroy
    redirect_to user_items_url, notice: 'User item was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_item
      @user_item = UserItem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_item_params
      params.require(:user_item).permit(:user_id, :item_id, :amount, :status, :change_status_date)
    end
end
