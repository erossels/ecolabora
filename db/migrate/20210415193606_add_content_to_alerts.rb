class AddContentToAlerts < ActiveRecord::Migration[6.0]
  def up
    add_column :alerts, :content, :text
    remove_reference :alerts, :category_id, index: true, foreign_key: true
  end

  def down
    remove_column :alerts, :content, :text
    add_reference :alerts, :category_id, index: true, foreign_key: true
  end
end
