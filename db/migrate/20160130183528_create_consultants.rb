class CreateConsultants < ActiveRecord::Migration
  def change
    create_table :consultants do |t|
      t.string :name
      t.string :nickname
      t.string :email
      t.money :outcome
      t.money :income
      t.money :balance

      t.timestamps
    end
  end
end