class ChangesInAlert < ActiveRecord::Migration[6.0]
  def up
    add_column :alerts, :content, :text
  end

  def down
    remove_column :alerts, :content, :text
  end
end
