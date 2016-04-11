class AddAddressLinkToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :address_link, :string
  end
end
