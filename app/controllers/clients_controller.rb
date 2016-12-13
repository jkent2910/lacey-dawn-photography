class ClientsController < ApplicationController

  before_action :set_client, only: [:show, :edit, :update, :destroy, :show_client_photos, :favorite_picture, :unfavorite_picture, :client_favorites]
  before_action :authenticate_user!, except: [:show_client_photos, :favorite_picture, :unfavorite_picture, :client_favorites]
  before_filter :authenticate, only: [:show_client_photos]

  def index

  end

  def show
    @pictures = @client.pictures
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)

    if params[:images]
      params[:images].each { |image|
        @client.pictures.create(image: image)
      }
    end

    respond_to do |format|
      if @client.save
        format.html { redirect_to dashboard_path, notice: "Client created!" }
        format.json { render :show, status: :created, location: @client}
      else
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity}
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @client.update(client_params)

        if params[:images]
          params[:images].each { |image|
            @client.pictures.create(image: image)
          }
        end

        format.html { redirect_to dashboard_path, notice: "Client updated" }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_path, notice: 'Client deleted.' }
      format.json { head :no_content }
    end
  end

  def show_client_photos
    @pictures = @client.pictures
  end

  def favorite_picture
    picture = Picture.find(params[:picture_id])
    picture.update_attributes(favorite: true)
    redirect_to show_client_photos_client_path, notice: "Photo Favorited!"
  end

  def unfavorite_picture
    picture = Picture.find(params[:picture_id])
    picture.update_attributes(favorite: false)
    redirect_to show_client_photos_client_path, notice: "Favorite Removed!"
  end

  def client_favorites
    @pictures = @client.pictures.where(favorite: true)
  end

  private

  def authenticate
    @client = Client.find(params[:id])

    authenticate_or_request_with_http_basic do |username, password|
      username == "lacey" && password == @client.client_password
    end
  end

  def set_client
    @client = Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:client_password, :first_name, :last_name, :session_name, :pictures)
  end

end