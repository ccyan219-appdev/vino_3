class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :establishment_type
      t.string :address
      t.string :city
      t.time :time_open
      t.time :time_close

      t.timestamps

    end
  end
end
