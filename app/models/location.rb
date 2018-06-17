class Location < ApplicationRecord
  # Direct associations

  has_many   :listings,
             :dependent => :destroy

  # Indirect associations

  has_many   :users,
             :through => :wines,
             :source => :users

  has_many   :histories,
             :through => :listings,
             :source => :histories

  has_many   :wines,
             :through => :listings,
             :source => :wine

  # Validations

end
