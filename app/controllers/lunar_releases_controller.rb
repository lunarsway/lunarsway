class LunarReleasesController < ApplicationController

  layout "standard-layout"
  
  # GET /lunar_releases
  # GET /lunar_releases.xml
  def index
    @lunar_releases = LunarRelease.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @lunar_releases }
    end
  end

  # GET /lunar_releases/1
  # GET /lunar_releases/1.xml
  def show
    @lunar_release = LunarRelease.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @lunar_release }
    end
  end

  # GET /lunar_releases/new
  # GET /lunar_releases/new.xml
  def new
    @lunar_release = LunarRelease.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @lunar_release }
    end
  end

  # GET /lunar_releases/1/edit
  def edit
    @lunar_release = LunarRelease.find(params[:id])
  end

  # POST /lunar_releases
  # POST /lunar_releases.xml
  def create
    @lunar_release = LunarRelease.new(params[:lunar_release])

    respond_to do |format|
      if @lunar_release.save
        flash[:notice] = 'LunarRelease was successfully created.'
        format.html { redirect_to(@lunar_release) }
        format.xml  { render :xml => @lunar_release, :status => :created, :location => @lunar_release }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @lunar_release.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /lunar_releases/1
  # PUT /lunar_releases/1.xml
  def update
    @lunar_release = LunarRelease.find(params[:id])

    respond_to do |format|
      if @lunar_release.update_attributes(params[:lunar_release])
        flash[:notice] = 'LunarRelease was successfully updated.'
        format.html { redirect_to(@lunar_release) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @lunar_release.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /lunar_releases/1
  # DELETE /lunar_releases/1.xml
  def destroy
    @lunar_release = LunarRelease.find(params[:id])
    @lunar_release.destroy

    respond_to do |format|
      format.html { redirect_to(lunar_releases_url) }
      format.xml  { head :ok }
    end
  end
end
