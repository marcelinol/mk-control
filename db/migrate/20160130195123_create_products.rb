class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer    :code
      t.string     :name
      t.decimal    :purchase_price
      t.decimal    :sales_price
      t.integer    :points
      t.string     :product_type
      t.integer    :status,     default: 0
      t.references :request,    index: true
      t.references :consultant, index: true

      t.timestamps
    end
  end
end
