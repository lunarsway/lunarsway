class LunarRelease < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 15

  acts_as_fleximage do
    image_directory 'lunar_releases'

    image_storage_format :mp3
  end
end
