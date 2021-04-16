class Changecolumnincategory < ActiveRecord::Migration[6.0]
  def up
    change_column :categories, :category_id, :integer, :null => true
  end

  def down
    change_column :categories, :category_id, :integer, :null => false
  end
  
end
