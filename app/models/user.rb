class User < ActiveRecord::Base
  has_secure_password
  has_many :rentals
  has_many :superheros, through: :rentals
  has_many :ratings, through: :rentals


end
