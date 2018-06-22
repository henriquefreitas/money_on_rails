class CreatePayees < ActiveRecord::Migration[5.2]
  def change
    create_table :payees do |t|
      t.string :name, index: true
      t.json :data

      t.timestamps
    end
  end
end
