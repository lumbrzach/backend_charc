class AddRegionToSpots < ActiveRecord::Migration[5.2]
  def change
    add_column :spots, :region, :string
  end
end
