class MediaController < ApplicationController
  layout "standard-layout"
  
  def index
    @you_tube_videos = YouTubeVideo.find(:all, :order => "position ASC")
  end
end
