class EventsController < ApplicationController

 before_filter :authenticate_user! 
 
 def index
    @events = Event.find(:all, :order => 'page_views DESC', :limit => 18, :conditions => ["DATE(eventdate) BETWEEN ? AND ?", Date.today-30, Date.today])
	   
    respond_to do |format|
      format.html # index.html.erb popular events
      format.json { render :json => @events }
    end
  end

  def search
    @events = Event.search(params[:search])

    respond_to do |format|
      format.html # search.html.erb
      format.json { render :json => @events}
    end
  end

  def date

    @events = Event.find(:all, :conditions => ["DATE(eventdate) = ?", Date.parse("#{params[:date]['day']}-#{params[:date]['month']}-#{params[:date]['year']}")])
    
    respond_to do |format|
      format.html # date.html.erb
      format.json { render :json => @events }
    end
  end

  def tomorrow
    @events = Kaminari.paginate_array(Event.find(:all, :conditions => ["DATE(eventdate) = ?", Date.tomorrow])).page(params[:page]).per(20)
    
    respond_to do |format|
      format.html # tomorrow.html.erb
      format.json { render :json => @events }
    end
  end

  def recent
    @events = Kaminari.paginate_array(Event.find(:all, :order => 'created_at DESC')).page(params[:page]).per(20)
    
    respond_to do |format|
      format.html # recent.html.erb
      format.json { render :json => @events}
    end
  end

  def today
    @events = Kaminari.paginate_array(Event.find(:all, :conditions => ["DATE(eventdate) = ?", Date.today])).page(params[:page]).per(20)
     
    respond_to do |format|
      format.html # today.html.erb
      format.json { render :json => @events}
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    
    @event = Event.find(params[:id])
    @event.update_attribute(:page_views, @event.page_views + 1) 
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new
    @event.update_attribute(:user_id, current_user.id)
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, :notice => 'Event was successfully created.' }
        format.json { render :json => @event, :status => :created, :location => @event }
      else
        format.html { render :action => "new" }
        format.json { render :json => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, :notice => 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy
	
    respond_to do |format|
      format.html { redirect_to events_url, :notice => "Event successfully deleted." }
      format.json { head :no_content }
    end
  end
end
