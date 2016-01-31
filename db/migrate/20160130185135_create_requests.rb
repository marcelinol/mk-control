class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.text       :details
      t.references :consultant
      t.decimal    :cost

      t.timestamps
    end
  end
end
