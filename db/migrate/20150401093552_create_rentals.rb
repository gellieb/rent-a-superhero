class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
      t.references :user
      t.references :superhero
      t.text :reason, null: false
      t.references :rating

      t.timestamps null: false
    end
  end
end
