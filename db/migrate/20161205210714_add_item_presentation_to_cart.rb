class AddItemPresentationToCart < ActiveRecord::Migration
  def change
    add_column :carts, :item_presentation, :string
  end
end
