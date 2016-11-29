class ItemsController < ApplicationController

  before_action :set_item, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :create, :new, :update, :destroy]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to items_path, notice: "Item created!" }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity}
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @item.update(item_params)

        format.html { redirect_to items_path, notice: "Item updated" }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_path, notice: 'Item deleted.' }
      format.json { head :no_content }
    end
  end

  def add_to_cart
    @picture = Picture.find(params[:picture_id])
    @items = Item.all
    @client = Client.find(params[:client_id])
  end

  def add_items_to_cart
    item = Item.find(params[:item])
    quantity = params[:quantity]
    client = Client.find(params[:client_id])

    client.carts.create(item_id: item.id, item_quantity: quantity, client_id: client.id)

    redirect_to show_client_photos_client_path(client), notice: "Item added to cart!"
  end

  def view_cart
    client = Client.find(params[:client_id])
    @items = client.carts 
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :quantity, :price)
  end

end