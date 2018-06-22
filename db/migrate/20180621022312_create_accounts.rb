class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.belongs_to :tenant, foreign_key: true
      t.string :name, null: false, index: true
      t.string :type, null: false, index: true
      t.decimal :opening_balance, precision: 8, scale: 2
      t.decimal :balance, precision: 8, scale: 2
      t.json :data

      t.timestamps
    end
  end
end
