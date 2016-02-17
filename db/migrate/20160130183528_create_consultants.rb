class CreateConsultants < ActiveRecord::Migration
  def change
    create_table :consultants do |t|
      t.string  :name
      t.string  :nickname
      t.string  :email
      t.decimal :outcome, default: 0
      t.decimal :income,  default: 0
      t.decimal :balance, default: 0

      t.timestamps
    end
  end
end
