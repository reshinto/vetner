class AddCountryAndPostalCodeToUserProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :user_profiles, :country, :string
    add_column :user_profiles, :postalcode, :string
  end
end
