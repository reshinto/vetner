class CreateUserProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :user_profiles do |t|
      t.string :first_name
      t.string :last_name
      t.text :address
      t.string :phone
      t.string :username
      t.text :image

      t.timestamps
    end
  end
end
