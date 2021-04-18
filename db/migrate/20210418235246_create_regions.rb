class CreateRegions < ActiveRecord::Migration[6.0]
  def change
    create_table :regions do |t|
      t.string :short_name
      t.string :name
      t.string :code

      t.timestamps
    end
  end
end
