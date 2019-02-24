class RemoveLastRequestAtFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :last_request_at
  end

  def down
    add_column :users, :last_request_at, :datetime
  end
end
