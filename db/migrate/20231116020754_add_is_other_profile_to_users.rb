class AddIsOtherProfileToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :is_instructor, :boolean, null:false, default: false
    add_column :users, :is_student, :boolean, null:false, default: false
    add_column :users, :is_maintenance, :boolean, null:false, default: false
    add_column :users, :is_frontoffice, :boolean, null:false, default: false
    add_column :users, :is_guest, :boolean, null:false, default: false
    add_column :users, :is_dispatcher, :boolean, null:false, default: false   
  end
end
