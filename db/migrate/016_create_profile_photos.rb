class CreateProfilePhotos < ActiveRecord::Migration
  def self.up
    create_table :profile_photos do |t|
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :profile_photos
  end
end
