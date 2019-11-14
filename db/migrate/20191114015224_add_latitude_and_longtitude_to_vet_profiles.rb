class AddLatitudeAndLongtitudeToVetProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :vet_profiles, :vetLat, :string
    add_column :vet_profiles, :vetLong, :string
  end
end
