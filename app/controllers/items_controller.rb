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

    if params[:esurface].present?
      item = Item.find_by(name: params[:esurface])
      client.carts.create(item_id: item.id, item_quantity: params[:quantity], client_id: client.id, picture_id: picture, photo_type: "E-Surface (matte)")
    end

    if params[:metalic].present?
      item = Item.find_by(name: params[:metalic])
      client.carts.create(item_id: item.id, item_quantity: params[:quantity], client_id: client.id, picture_id: picture, photo_type: "Metalic Print (glossy with silvery finish")
    end

    if params[:canvaswrap15].present?
      item = Item.find_by(name: params[:canvaswrap15])
      client.carts.create(item_id: item.id, item_quantity: params[:quantity], client_id: client.id, picture_id: picture, photo_type: "Canvas Wraps - 1.5 Deep")
    end

    if params[:canvaswrap25].present?
      item = Item.find_by(name: params[:canvaswrap25])
      client.carts.create(item_id: item.id, item_quantity: params[:quantity], client_id: client.id, picture_id: picture, photo_type: "Canvas Wraps - 2.5 Deep")
    end

    if params[:bamboo].present?
      item = Item.find_by(name: params[:bamboo])
      client.carts.create(item_id: item.id, item_quantity: params[:quantity], client_id: client.id, picture_id: picture, photo_type: "Bamboo Mounts")
    end

    if params[:metal].present?
      item = Item.find_by(name: params[:metal])
      client.carts.create(item_id: item.id, item_quantity: params[:quantity], client_id: client.id, picture_id: picture, photo_type: "Metal Prints")
    end

    if params[:curvemetal].present?
      item = Item.find_by(name: params[:curvemetal])
      client.carts.create(item_id: item.id, item_quantity: params[:quantity], client_id: client.id, picture_id: picture, photo_type: "Curve Metal Prints")
    end

    if params[:float34].present?
      item = Item.find_by(name: params[:float34])
      client.carts.create(item_id: item.id, item_quantity: params[:quantity], client_id: client.id, picture_id: picture, photo_type: "Float Wraps 3/4 Deep")
    end

    if params[:float15].present?
      item = Item.find_by(name: params[:float15])
      client.carts.create(item_id: item.id, item_quantity: params[:quantity], client_id: client.id, picture_id: picture, photo_type: "Float Wraps 1/2 Deep")
    end

    redirect_to show_client_photos_client_path(client), notice: "Item added to cart!"
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