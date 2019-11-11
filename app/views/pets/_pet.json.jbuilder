json.extract! pet, :id, :name, :pet_type, :date_of_birth, :breed, :image, :user_id, :created_at, :updated_at
json.url pet_url(pet, format: :json)
