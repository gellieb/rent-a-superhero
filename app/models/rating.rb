class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :superhero
  belongs_to :rental
end
