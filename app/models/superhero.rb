class Superhero < ActiveRecord::Base
  has_many :rentals
  has_many :users, through: :rentals
  has_many :ratings, through: :rentals


end
