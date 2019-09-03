class CreateJournals < ActiveRecord::Migration[5.2]
  def change
    create_table :journals do |t|
      t.references :spot, foreign_key: true
      t.references :user, foreign_key: true
      t.date :date
      t.integer :flow
      t.decimal :height
      t.string :pref_charc
      t.string :quality
      t.text :description

      t.timestamps
    end
  end
end
