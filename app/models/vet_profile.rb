class VetProfile < ApplicationRecord
  belongs_to :vet
  has_one_attached :image

  # for creating Full-Text Search Form with AJAX
  # http://www.ryanmcmahon.org/articles/11
  include PgSearch
  pg_search_scope :search_by_clinic_name, :against => [:clinic_name, :address, :postalcode],
    using: {
      :tsearch => {:prefix => true}
    }

end
