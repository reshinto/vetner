class AddUnitToUserProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :user_profiles, :unit, :string
  end
end
