class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.integer :user_id
      t.integer :listing_id
      t.string :comments
      t.integer :rating
      t.boolean :favorite

      t.timestamps

    end
  end
end
