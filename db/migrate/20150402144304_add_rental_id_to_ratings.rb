class AddRentalIdToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :rental_id, :integer
  end
end
