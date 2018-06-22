class CreateTransfers < ActiveRecord::Migration[5.2]
  def change
    create_table :transfers do |t|
      t.date :date, index: true
      t.references :from_account, index: true
      t.references :to_account, index: true
      t.decimal :amount, precision: 8, scale: 2
      t.timestamps
    end
  end
end
