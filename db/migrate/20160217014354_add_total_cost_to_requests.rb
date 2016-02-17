class AddTotalCostToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :total_cost, :decimal, default: 0
  end
end
