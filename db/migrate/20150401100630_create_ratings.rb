class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.references :user
      t.references :superhero
      t.integer :rating, precision: 1, scale: 0
    end
  end
end
