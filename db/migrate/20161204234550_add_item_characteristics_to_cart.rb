class AddItemCharacteristicsToCart < ActiveRecord::Migration
  def change
    add_column :carts, :item_print_surface, :string
    add_column :carts, :item_coating, :string
    add_column :carts, :item_textures, :string
    add_column :carts, :item_mounting, :string
  end
end
