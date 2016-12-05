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

  def client_items
    @client = Client.find(params[:client_id])
    @items = Item.where(photo_type: nil)
  end

  def add_items_to_cart

    client = Client.find(params[:client_id])
    picture = params[:picture_id]

    if params[:quantity].present?
      item = Item.find_by(name: params[:printsurface])
      client.carts.create(item_id: item.id, item_quantity: params[:quantity], client_id: client.id, picture_id: picture, photo_type: params[:printsurface], item_size: params[:size],
                          item_print_surface: params[:printsurface], item_coating: params[:protectivecoating], item_presentation: params[:presentation], item_textures: params[:texture], item_mounting: params[:mounting])
      redirect_to show_client_photos_client_path(client), notice: "Item added to cart!"
    else
      redirect_to show_client_photos_client_path(client), notice: "You must enter a quantity to add to the cart"
    end
  end

  def add_products_to_cart
    client = Client.find(params[:client_id])
    item = Item.find(params[:item_id])

    client.carts.create(item_id: item.id, client_id: client.id)

    redirect_to client_items_path(client_id: client.id), notice: "Added to Cart!"
  end

  def view_cart
    @client = Client.find(params[:client_id])
    @items = @client.carts
  end

  def send_cart
    client = Client.find(params[:client_id])
    CartMailer.send_cart(client).deliver_now

    redirect_to show_client_photos_client_path(client), notice: "Cart sent!  We'll be in touch shortly"
  end

  def remove_cart_item
    cart = Cart.find(params[:cart_id])
    cart.destroy
    client = Client.find(params[:client_id])

    redirect_to view_cart_path(client_id: client), notice: "Removed"
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :quantity, :price)
  end

end