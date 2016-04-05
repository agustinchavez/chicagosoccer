class CreatePitches < ActiveRecord::Migration
  def change
    create_table :pitches do |t|
      t.string :neighborhood, null: false
      t.string :pitch_type, null: false
      t.string :pitch_name, null: false
      t.string :address, null: false
      t.float :latitude, null: false
      t.float :longitude, null: false

      t.timestamps null: false
    end
  end
end
