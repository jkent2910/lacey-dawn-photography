class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.text :client_password
      t.string :first_name
      t.string :last_name
      t.string :session_name

      t.timestamps null: false
    end
  end
end
