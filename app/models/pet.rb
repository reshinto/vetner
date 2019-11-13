class Pet < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :pet_records, dependent: :destroy
end
