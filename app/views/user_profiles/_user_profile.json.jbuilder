# json.extract! user_profile, :id, :first_name, :last_name, :address, :phone, :username, :image, :user_id, :created_at, :updated_at
json.extract! user_profile, :id, :userLat, :userLong
json.url user_profile_url(user_profile, format: :json)
