class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string    :name
      t.string    :source
      t.integer   :status
      t.datetime  :last_contact_date
      t.string    :email
      t.text      :observations

      t.timestamps
    end
  end
end
