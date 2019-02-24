class RemoveUpdateAtFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :updated_at
  end

  def down
    add_column :users, :updated_at, :datetime
  end
end
