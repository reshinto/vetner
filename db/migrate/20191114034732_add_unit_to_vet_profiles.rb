class AddUnitToVetProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :vet_profiles, :unit, :string
  end
end
