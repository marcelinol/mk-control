class ChangeSalesTotalCostName < ActiveRecord::Migration
  def change
    rename_column :sales, :total_cost, :value
  end
end
