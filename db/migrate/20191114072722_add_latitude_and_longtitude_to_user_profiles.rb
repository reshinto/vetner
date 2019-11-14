class AddLatitudeAndLongtitudeToUserProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :user_profiles, :userLat, :string
    add_column :user_profiles, :userLong, :string
  end
end
