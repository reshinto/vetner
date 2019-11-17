class RemoveDistanceColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :users_vets, :distance
  end
end
