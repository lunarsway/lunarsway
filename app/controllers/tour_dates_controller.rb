class TourDatesController < ApplicationController
  # GET /tour_dates
  # GET /tour_dates.xml
  def index
    @tour_dates = TourDate.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tour_dates }
    end
  end

  # GET /tour_dates/1
  # GET /tour_dates/1.xml
  def show
    @tour_date = TourDate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tour_date }
    end
  end

  # GET /tour_dates/new
  # GET /tour_dates/new.xml
  def new
    @tour_date = TourDate.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tour_date }
    end
  end

  # GET /tour_dates/1/edit
  def edit
    @tour_date = TourDate.find(params[:id])
  end

  # POST /tour_dates
  # POST /tour_dates.xml
  def create
    @tour_date = TourDate.new(params[:tour_date])

    respond_to do |format|
      if @tour_date.save
        flash[:notice] = 'TourDate was successfully created.'
        format.html { redirect_to(@tour_date) }
        format.xml  { render :xml => @tour_date, :status => :created, :location => @tour_date }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tour_date.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tour_dates/1
  # PUT /tour_dates/1.xml
  def update
    @tour_date = TourDate.find(params[:id])

    respond_to do |format|
      if @tour_date.update_attributes(params[:tour_date])
        flash[:notice] = 'TourDate was successfully updated.'
        format.html { redirect_to(@tour_date) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tour_date.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tour_dates/1
  # DELETE /tour_dates/1.xml
  def destroy
    @tour_date = TourDate.find(params[:id])
    @tour_date.destroy

    respond_to do |format|
      format.html { redirect_to(tour_dates_url) }
      format.xml  { head :ok }
    end
  end
end
