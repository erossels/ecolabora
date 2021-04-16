class AddNameToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :name, :string
  end
end
