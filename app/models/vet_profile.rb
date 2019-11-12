class VetProfile < ApplicationRecord
  belongs_to :vet
  has_one_attached :image
end
