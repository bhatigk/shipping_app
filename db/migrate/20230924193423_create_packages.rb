class CreatePackages < ActiveRecord::Migration[7.0]
  def change
    create_table :packages do |t|
      t.string :package_name
      t.text :description
      t.decimal :weight

      t.timestamps
    end
  end
end
