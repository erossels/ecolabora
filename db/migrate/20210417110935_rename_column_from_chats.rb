class RenameColumnFromChats < ActiveRecord::Migration[6.0]
  def self.up
    rename_column :chats, :sales_id, :sale_id
  end

  def self.down
    rename_column :chats, :sale_id, :sales_id
  end
  
end
