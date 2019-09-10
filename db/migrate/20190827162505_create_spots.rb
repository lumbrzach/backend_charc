class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|
      t.string :name
      t.string :river
      t.string :river_section
      t.string :country
      t.string :region
      t.string :state
      t.string :city
      t.string :gauge_name
      t.string :min_flow
      t.string :ideal_flow
      t.string :max_flow
      t.decimal :lat, { precision: 10, scale: 6 }
      t.decimal :long, { precision: 10, scale: 6 }
      t.string :gauge_url
      t.string :prediction_url
      t.text :description
      t.string :gauge_num
      t.string :flow_type
      t.string :zoom_level
      t.string :quality
      t.string :crtd_by
      t.timestamps
    end
  end
end
