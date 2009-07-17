class TourDatesAddDoorsOpen < ActiveRecord::Migration
  def self.up
    add_column :tour_dates, :doors_open, :string
  end

  def self.down
    remove_column :tour_dates, :doors_open
  end
end
