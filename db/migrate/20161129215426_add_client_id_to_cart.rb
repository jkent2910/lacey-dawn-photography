class AddClientIdToCart < ActiveRecord::Migration
  def change
    add_column :carts, :client_id, :integer
  end
end
