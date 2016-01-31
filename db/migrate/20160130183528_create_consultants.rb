class CreateConsultants < ActiveRecord::Migration
  def change
    create_table :consultants do |t|
      t.string  :name
      t.string  :nickname
      t.string  :email
      t.decimal :outcome
      t.decimal :income
      t.decimal :balance

      t.timestamps
    end
  end
end
