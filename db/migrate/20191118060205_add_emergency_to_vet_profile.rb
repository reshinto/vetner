class AddEmergencyToVetProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :vet_profiles, :emergency, :boolean, default: false
  end
end
