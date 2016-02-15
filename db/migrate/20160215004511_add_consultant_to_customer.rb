class AddConsultantToCustomer < ActiveRecord::Migration
  def change
    add_reference :customers, :consultant, index: true
  end
end
