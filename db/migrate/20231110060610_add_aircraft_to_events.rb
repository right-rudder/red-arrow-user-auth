class AddAircraftToEvents < ActiveRecord::Migration[7.1]
  def change
    add_reference :events, :aircraft, null: false, foreign_key: true
  end
end
