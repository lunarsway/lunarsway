class CreateYouTubeVideos < ActiveRecord::Migration
  def self.up
    create_table :you_tube_videos do |t|
      t.integer :position
      t.string :title
      t.text :embed_code

      t.timestamps
    end
  end

  def self.down
    drop_table :you_tube_videos
  end
end
