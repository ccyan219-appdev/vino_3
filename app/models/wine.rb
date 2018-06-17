class Wine < ApplicationRecord
  # Direct associations

  has_many   :listings,
             :dependent => :destroy

  # Indirect associations

  has_many   :locations,
             :through => :listings,
             :source => :location

  # Validations

end
