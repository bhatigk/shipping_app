class CreateShipments < ActiveRecord::Migration[7.0]
  def change
    create_table :shipments do |t|
      t.hstore :source_location
      t.hstore :target_location
      t.integer :status, default: 0
      t.references :package, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: { to_table: :users }
      t.references :delivery_partner, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
