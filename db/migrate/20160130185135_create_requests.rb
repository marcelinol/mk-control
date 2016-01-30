class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.text :details
      t.integer :consultant_id

      t.timestamps
    end
  end
end
