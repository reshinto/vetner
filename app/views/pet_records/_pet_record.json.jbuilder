json.extract! pet_record, :id, :title, :date, :content, :pet_id, :created_at, :updated_at
json.url pet_record_url(pet_record, format: :json)
