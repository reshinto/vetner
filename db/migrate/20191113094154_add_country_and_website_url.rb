class AddCountryAndWebsiteUrl < ActiveRecord::Migration[5.2]
  def change
    add_column :vet_profiles, :country, :string
    add_column :vet_profiles, :website, :text
  end
end
