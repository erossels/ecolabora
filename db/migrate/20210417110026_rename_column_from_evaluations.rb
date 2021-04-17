class RenameColumnFromEvaluations < ActiveRecord::Migration[6.0]
  def self.up
    rename_column :evaluations, :transaction_id, :sale_id
  end

  def self.down
    rename_column :evaluations, :sale_id, :transaction_id
  end
end
