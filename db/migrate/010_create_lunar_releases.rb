class CreateLunarReleases < ActiveRecord::Migration
  def self.up
    create_table :lunar_releases do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end

  def self.down
    drop_table :lunar_releases
  end
end
