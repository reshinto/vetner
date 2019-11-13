class VetProfile < ApplicationRecord
  belongs_to :vet
  has_one_attached :image

  include PgSearch
  pg_search_scope :search_by_clinic_name, :against => [:clinic_name],
    using: {
      :tsearch => {:prefix => true}
    }

end
