class Listing < ApplicationRecord
  # Direct associations

  belongs_to :location

  has_many   :histories,
             :dependent => :destroy

  belongs_to :wine

  # Indirect associations

  # Validations

end
