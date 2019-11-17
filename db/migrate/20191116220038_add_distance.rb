class AddDistance < ActiveRecord::Migration[5.2]
  def change
    add_column :users_vets, :distance, :string
  end
end
