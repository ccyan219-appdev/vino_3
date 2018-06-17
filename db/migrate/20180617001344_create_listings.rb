class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.integer :wine_id
      t.integer :location_id
      t.float :price

      t.timestamps

    end
  end
end
