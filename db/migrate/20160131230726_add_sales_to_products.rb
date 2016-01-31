class AddSalesToProducts < ActiveRecord::Migration
  def change
    add_reference :products, :sale, index: true
  end
end
