class MailingListItemsController < ApplicationController
  layout "standard-layout"
  
  # GET /mailing_list_items
  # GET /mailing_list_items.xml
  def index
    @mailing_list_items = MailingListItem.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @mailing_list_items }
    end
  end

  # GET /mailing_list_items/1
  # GET /mailing_list_items/1.xml
  def show
    @mailing_list_item = MailingListItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @mailing_list_item }
    end
  end

  # GET /mailing_list_items/new
  # GET /mailing_list_items/new.xml
  def new
    @mailing_list_item = MailingListItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @mailing_list_item }
    end
  end

  # GET /mailing_list_items/1/edit
  def edit
    @mailing_list_item = MailingListItem.find(params[:id])
  end

  # POST /mailing_list_items
  # POST /mailing_list_items.xml
  def create
    @mailing_list_item = MailingListItem.new(params[:mailing_list_item])

    respond_to do |format|
      if @mailing_list_item.save
        flash[:notice] = 'MailingListItem was successfully created.'
        MailingListItemMailer.deliver_signup_notification(@mailing_list_item)
        format.html { redirect_to(@mailing_list_item) }
        format.xml  { render :xml => @mailing_list_item, :status => :created, :location => @mailing_list_item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mailing_list_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /mailing_list_items/1
  # PUT /mailing_list_items/1.xml
  def update
    @mailing_list_item = MailingListItem.find(params[:id])

    respond_to do |format|
      if @mailing_list_item.update_attributes(params[:mailing_list_item])
        flash[:notice] = 'MailingListItem was successfully updated.'
        format.html { redirect_to(@mailing_list_item) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @mailing_list_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /mailing_list_items/1
  # DELETE /mailing_list_items/1.xml
  def destroy
    @mailing_list_item = MailingListItem.find(params[:id])
    @mailing_list_item.destroy

    respond_to do |format|
      format.html { redirect_to(mailing_list_items_url) }
      format.xml  { head :ok }
    end
  end
end
