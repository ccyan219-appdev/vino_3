class User < ApplicationRecord
  # Direct associations

  has_many   :histories,
             :dependent => :destroy

  # Indirect associations

  has_many   :locations,
             :through => :wines,
             :source => :locations

  has_many   :wines,
             :through => :histories,
             :source => :wine

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
