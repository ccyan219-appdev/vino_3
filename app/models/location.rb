class Location < ApplicationRecord
  # Direct associations

  has_many   :listings,
             :dependent => :destroy

  # Indirect associations

  has_many   :wines,
             :through => :listings,
             :source => :wine

  # Validations

end
