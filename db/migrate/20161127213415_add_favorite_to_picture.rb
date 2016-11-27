class AddFavoriteToPicture < ActiveRecord::Migration
  def change
    add_column :pictures, :favorite, :boolean, default: false
  end
end
