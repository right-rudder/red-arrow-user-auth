class AddAdditionalAttributesToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :first_name, :string, default: 'Guest'
    add_column :users, :middle_initial, :string
    add_column :users, :last_name, :string, default: 'User'
    add_column :users, :birthday, :date
    add_column :users, :address_1, :string
    add_column :users, :address_2, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zip_code, :string
    add_column :users, :phone, :string
    add_column :users, :emergency_contact_name, :string
    add_column :users, :emergency_contact_number, :string
  end
end