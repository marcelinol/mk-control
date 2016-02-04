class AddNextContactDateToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :next_contact_date, :datetime
  end
end
