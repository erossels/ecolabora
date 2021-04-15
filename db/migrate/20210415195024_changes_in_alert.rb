class ChangesInAlert < ActiveRecord::Migration[6.0]
  def up
    add_column :alerts, :content, :text
    remove_column :alerts, :category_id
  end

  def down
    remove_column :alerts, :content, :text
    add_column :alerts, :category_id, index: true, foreign_key: true
  end
end
