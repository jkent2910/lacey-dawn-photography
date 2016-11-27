class AddClientIdToPicture < ActiveRecord::Migration
  def change
    add_column :pictures, :client_id, :integer
  end
end
