class UsersVets < ActiveRecord::Migration[5.2]
  def change
    create_table :users_vets do |t|
      t.references :user
      t.references :vet
      t.timestamps
    end    
  end
end
