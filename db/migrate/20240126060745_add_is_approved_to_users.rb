class AddIsApprovedToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :is_approved, :boolean, null:false, default: false
  end
end
