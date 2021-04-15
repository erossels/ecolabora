class CreateEvaluations < ActiveRecord::Migration[6.0]
  def change
    create_table :evaluations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :transaction, null: false, foreign_key: true
      t.integer :grade

      t.timestamps
    end
  end
end
