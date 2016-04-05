class CreatePitches < ActiveRecord::Migration
  def change
    create_table :pitches do |t|
      t.string :neighborhood
      t.string :pitch_type
      t.string :pitch_name
      t.string :address
      t.float :latitude, null: false
      t.float :longitude, null: false

      t.timestamps null: false
    end
  end
end
