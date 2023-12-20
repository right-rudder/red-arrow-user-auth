class CreateBioCredentials < ActiveRecord::Migration[7.1]
  def change
    create_table :bio_credentials do |t|
      t.text :bio, null: false, default: "" 
      t.string :license_number
      t.text :license_description
      t.date :license_effective_date
      t.date :license_expire_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
