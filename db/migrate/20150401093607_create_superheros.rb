class CreateSuperheros < ActiveRecord::Migration
  def change
    create_table :superheros do |t|
      t.string :name
      t.string :specialty, default: "general superhero"
      t.float :overall_rating, precision: 2, scale: 1

      t.timestamps null: false
    end
  end
end
