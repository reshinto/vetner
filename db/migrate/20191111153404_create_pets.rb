class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :pet_type
      t.date :date_of_birth
      t.string :breed
      t.text :image
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
