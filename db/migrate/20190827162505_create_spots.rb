class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|
      t.string :name
      t.decimal :lat, { precision: 10, scale: 6 }
      t.decimal :long, { precision: 10, scale: 6 }
      t.string :country
      t.string :city
      t.string :state
      t.string :quality
      t.string :river
      t.string :river_section
      t.string :gauge_url
      t.string :min_flow
      t.string :max_flow
      t.string :ideal_flow
      t.text :description
      t.string :water_temp
      t.string :current_cfs
      t.string :current_height
      t.string :turbidity
      t.string :pH
      t.string :gauge_name
      t.string :gauge_num
      t.string :region

      t.timestamps
    end
  end
end
