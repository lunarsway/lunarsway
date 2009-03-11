class MigratePhotoToMilton < ActiveRecord::Migration
  def self.up
    add_column :photos, :filename, :string
    add_column :photos, :content_type, :string
  end

  def self.down
    remove_column :photos, :filename
    remove_column :photos, :content_type
  end
end
