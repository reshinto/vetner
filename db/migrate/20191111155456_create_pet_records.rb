class CreatePetRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :pet_records do |t|
      t.string :title
      t.date :date
      t.text :content
      t.references :pet, foreign_key: true

      t.timestamps
    end
  end
end
