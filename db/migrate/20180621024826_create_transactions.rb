class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.belongs_to :account, index: true
      t.date :date, index: true
      t.belongs_to :payee, foreign_key: true
      t.decimal :amount, precision: 8, scale: 2
      t.string :memo

      t.timestamps
    end
  end
end
