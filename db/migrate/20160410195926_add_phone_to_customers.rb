class AddPhoneToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :cellphone, :string
    add_column :customers, :phone, :string
  end
end
