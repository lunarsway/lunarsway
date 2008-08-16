class TourDatesAddShowDate < ActiveRecord::Migration
  def self.up
    add_column :tour_dates, :show_date, :datetime
  end

  def self.down
    remove_column :tour_dates, :show_date
  end
end
