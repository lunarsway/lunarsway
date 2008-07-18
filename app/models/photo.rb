class Photo < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 30

  acts_as_fleximage do
    image_directory 'fleximages/photos'
    require_image true

    image_storage_format :jpg
  end
end
