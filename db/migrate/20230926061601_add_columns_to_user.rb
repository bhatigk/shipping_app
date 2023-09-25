class AddColumnsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :type, :string, default: 'Customer'
    add_column :users, :phone_number, :string
    add_column :users, :company_name, :string
  end
end
