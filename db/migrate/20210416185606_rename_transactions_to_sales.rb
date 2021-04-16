class RenameTransactionsToSales < ActiveRecord::Migration[6.0]
  def self.up
    rename_table :transactions, :sales
    rename_column :chats, :transaction_id, :sales_id
  end

  def self.down
    rename_table :sales, :transactions
    rename_column :chats, :sales_id, :transaction_id
  end

end
