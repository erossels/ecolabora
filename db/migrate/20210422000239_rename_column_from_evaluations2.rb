class RenameColumnFromEvaluations2 < ActiveRecord::Migration[6.0]

  def self.up
    rename_column :evaluations, :sale_id, :purchase_id
  end

  def self.down
    rename_column :evaluations, :purchase_id, :sale_id
  end

end
