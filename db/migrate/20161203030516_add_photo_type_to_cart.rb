class AddPhotoTypeToCart < ActiveRecord::Migration
  def change
    add_column :carts, :photo_type, :string
  end
end
