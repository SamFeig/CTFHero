class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first
      t.string :last
      t.string :username
      t.date :birthday

      t.timestamps
    end
  end
end
