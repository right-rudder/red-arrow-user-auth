class CreateDocuments < ActiveRecord::Migration[7.1]
  def change
    create_table :documents do |t|
      t.string :name
      t.text :description
      t.string :location
      t.boolean :hide
      t.boolean :is_instructor
      t.boolean :is_student
      t.boolean :is_maintenance
      t.boolean :is_frontoffice
      t.boolean :is_dispatcher
      t.boolean :is_guest

      t.timestamps
    end
  end
end
