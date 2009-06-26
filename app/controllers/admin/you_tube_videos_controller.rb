class Admin::YouTubeVideosController < ApplicationController
  before_filter :admin_login_required
  layout "standard-layout"

  def update_positions
    params[:div].each_with_index do |id, position|
      YouTubeVideo.update(id, {:position => position + 1})
    end
    
    render :nothing => true    
  end
  
  # GET /you_tube_videos
  # GET /you_tube_videos.xml
  def index
    @you_tube_videos = YouTubeVideo.find(:all, :order => "position ASC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @you_tube_videos }
    end
  end

  # GET /you_tube_videos/1
  # GET /you_tube_videos/1.xml
  def show
    @you_tube_video = YouTubeVideo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @you_tube_video }
    end
  end

  # GET /you_tube_videos/new
  # GET /you_tube_videos/new.xml
  def new
    @you_tube_video = YouTubeVideo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @you_tube_video }
    end
  end

  # GET /you_tube_videos/1/edit
  def edit
    @you_tube_video = YouTubeVideo.find(params[:id])
  end

  # POST /you_tube_videos
  # POST /you_tube_videos.xml
  def create
    @you_tube_video = YouTubeVideo.new(params[:you_tube_video])

    respond_to do |format|
      if @you_tube_video.save
        flash[:notice] = 'YouTubeVideo was successfully created.'
        format.html { redirect_to(admin_you_tube_videos_url) }
        format.xml  { render :xml => @you_tube_video, :status => :created, :location => @you_tube_video }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @you_tube_video.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /you_tube_videos/1
  # PUT /you_tube_videos/1.xml
  def update
    @you_tube_video = YouTubeVideo.find(params[:id])

    respond_to do |format|
      if @you_tube_video.update_attributes(params[:you_tube_video])
        flash[:notice] = 'YouTubeVideo was successfully updated.'
        format.html { redirect_to(@you_tube_video) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @you_tube_video.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /you_tube_videos/1
  # DELETE /you_tube_videos/1.xml
  def destroy
    @you_tube_video = YouTubeVideo.find(params[:id])
    @you_tube_video.destroy

    respond_to do |format|
      format.html { redirect_to(you_tube_videos_url) }
      format.xml  { head :ok }
    end
  end
end
