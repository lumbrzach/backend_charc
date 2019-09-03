class CreateEventSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :event_spots do |t|
      t.references :event, foreign_key: true
      t.references :spot, foreign_key: true

      t.timestamps
    end
  end
end
