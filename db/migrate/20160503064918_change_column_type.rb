class ChangeColumnType < ActiveRecord::Migration
  def change
    rename_column :loans, :type, :loan_type
  end
end
