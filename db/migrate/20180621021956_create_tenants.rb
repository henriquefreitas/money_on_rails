class CreateTenants < ActiveRecord::Migration[5.2]
  def change
    create_table :tenants do |t|
      t.string :subdomain, index: true
      t.json :data

      t.timestamps
    end
  end
end
