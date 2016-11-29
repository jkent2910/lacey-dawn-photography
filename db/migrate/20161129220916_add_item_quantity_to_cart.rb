class AddItemQuantityToCart < ActiveRecord::Migration
  def change
    add_column :carts, :item_quantity, :integer
  end
end
