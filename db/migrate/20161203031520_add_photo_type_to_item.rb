class AddPhotoTypeToItem < ActiveRecord::Migration
  def change
    add_column :items, :photo_type, :string
  end
end
