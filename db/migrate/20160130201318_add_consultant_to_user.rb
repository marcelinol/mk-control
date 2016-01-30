class AddConsultantToUser < ActiveRecord::Migration
  def change
    add_reference :users, :consultant, index: true
  end
end
