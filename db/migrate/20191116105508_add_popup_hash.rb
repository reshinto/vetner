class AddPopupHash < ActiveRecord::Migration[5.2]
  def change
    add_column :vet_profiles, :popupdetails, :text
  end
end
