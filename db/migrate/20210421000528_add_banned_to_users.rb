class AddBannedToUsers < ActiveRecord::Migration[6.0]
  def up
    add_column :users, :banned, :boolean
  end

  def down
    remove_column :users, :banned, :boolean
  end
end
