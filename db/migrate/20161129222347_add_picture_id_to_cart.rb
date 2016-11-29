class AddPictureIdToCart < ActiveRecord::Migration
  def change
    add_column :carts, :picture_id, :integer
  end
end
