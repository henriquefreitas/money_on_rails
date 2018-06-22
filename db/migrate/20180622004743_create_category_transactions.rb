class CreateCategoryTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :category_transactions do |t|
      t.belongs_to :category, foreign_key: true
      t.belongs_to :transaction, foreign_key: true
      t.string :amount

      t.timestamps
    end
  end
end
