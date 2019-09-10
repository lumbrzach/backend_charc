class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.text :description
      t.date :date
      t.boolean :completed, default: false
      t.string :photo_url
      t.string :alt_spot_1
      t.string :alt_spot_2
      t.string :alt_spot_3
      t.string :alt_spot_4

      t.timestamps
    end
  end
end
