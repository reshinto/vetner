class DropCountryFromUserAndVetProfiles < ActiveRecord::Migration[5.2]
  def change
    remove_column :user_profiles, :country
    remove_column :vet_profiles, :country
  end
end
