class CreateWallPhotos < ActiveRecord::Migration
  def self.up
    create_table :wall_photos do |t|
      t.string :caption
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :wall_photos
  end
end
