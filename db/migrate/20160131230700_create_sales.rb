class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.references :customer, index: true
      t.decimal :total_cost

      t.timestamps
    end
  end
end
