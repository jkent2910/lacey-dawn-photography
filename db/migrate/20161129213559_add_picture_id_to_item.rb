class AddPictureIdToItem < ActiveRecord::Migration
  def change
    add_column :items, :picture_id, :integer
  end
end
