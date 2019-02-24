class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :title
      t.text :body
      t.references :receiving_user
      t.references :sending_user

      t.timestamps
    end
    add_index :messages, :receiving_user_id
    add_index :messages, :sending_user_id
  end
end
