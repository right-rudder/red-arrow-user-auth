class AddInstructorUserIdToEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :instructor_user_id, :bigint
  end
end
