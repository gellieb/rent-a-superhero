class Superhero < ActiveRecord::Base
  has_many :rentals
  has_many :users, through: :rentals
  has_many :ratings, through: :rentals

  def overall_rate


  end

end
