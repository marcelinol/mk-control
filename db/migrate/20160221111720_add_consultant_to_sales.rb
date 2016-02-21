class AddConsultantToSales < ActiveRecord::Migration
  def change
    add_reference :sales, :consultant, index: true
  end
end
