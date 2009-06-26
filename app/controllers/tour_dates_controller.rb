class TourDatesController < ApplicationController
  layout "standard-layout"
  
  # GET /tour_dates
  # GET /tour_dates.xml
  def index
    @tour_dates = TourDate.find(:all, :order => "show_date DESC")

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

end
