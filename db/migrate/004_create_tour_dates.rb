class CreateTourDates < ActiveRecord::Migration
  def self.up
    create_table :tour_dates do |t|
      t.string :title
      t.string :location
      t.text :description
      t.string :address
      t.string :price_ahead
      t.string :price_door

      t.timestamps
    end
  end

  def self.down
    drop_table :tour_dates
  end
end
