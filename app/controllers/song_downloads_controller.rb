class SongDownloadsController < ApplicationController
  def get
    send_file "audio/" + params[:id].gsub("+", " ") + ".mp3", :type => "audio/mp3"
  end
end
