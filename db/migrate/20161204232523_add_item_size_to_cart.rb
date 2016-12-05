class AddItemSizeToCart < ActiveRecord::Migration
  def change
    add_column :carts, :item_size, :string
  end
end
