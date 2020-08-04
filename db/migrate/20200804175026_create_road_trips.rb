class CreateRoadTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :road_trips do |t|
      t.references :user, foreign_key: true
      t.string :origin
      t.string :destination
      t.string :travel_time
      t.float :temp
      t.string :temp_description

      t.timestamps
    end
  end
end
