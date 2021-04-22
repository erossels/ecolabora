class RenameSalesToPurchase < ActiveRecord::Migration[6.0]

  def self.up
    rename_table :sales, :purchases
    rename_column :chats, :sale_id, :purchase_id
  end

  def self.down
    rename_table :purchases, :sales
    rename_column :chats, :purchase_id, :sale_id
  end

end
