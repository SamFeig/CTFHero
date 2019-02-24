class AddFieldsToUser < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :last_sign_in_ip, :string
  	add_column :users, :favorite_pokemon, :string
  	add_column :users, :favorite_programming_language, :string
  end
end
