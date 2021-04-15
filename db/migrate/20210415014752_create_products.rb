class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.references :category, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :description
      t.integer :r_action
      t.integer :status

      t.timestamps
    end
  end
end
