class CreateVetProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :vet_profiles do |t|
      t.text :clinic_name
      t.text :address
      t.string :postalcode
      t.string :phone
      t.string :hours
      t.text :services
      t.references :vet, foreign_key: true
      t.text :image

      t.timestamps
    end
  end
end
