class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.references :user, foreign_key: true
      t.references :spot, foreign_key: true
      t.string :source
      t.text :comment
      t.string :username
      t.date :add_date

      t.timestamps
    end
  end
end
