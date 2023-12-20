class CreateAircrafts < ActiveRecord::Migration[7.1]
  def change
    create_table :aircrafts do |t|
      t.string :name
      t.string :model
      t.string :tail_number
      t.string :status
      
      t.timestamps
    end
  end
end
