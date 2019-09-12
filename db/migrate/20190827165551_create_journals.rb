class CreateJournals < ActiveRecord::Migration[5.2]
  def change
    create_table :journals do |t|
      t.references :spot, foreign_key: true
      t.references :user, foreign_key: true
      t.string :spot_name
      t.string :username
      t.date :date
      t.string :river_level
      t.string :pref_charc
      t.string :quality
      t.text :explore_notes
      t.integer :high_water_event
      t.timestamps
    end
  end
end

  