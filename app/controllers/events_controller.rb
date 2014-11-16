class EventsController < ApplicationController

  before_action :authenticate_user
  before_action :is_owner, only: [:update, :edit]
  expose(:categories)
  expose_decorated(:events) { get_proper_events }
  expose_decorated(:event)
  expose(:my) { Geolocator.new(current_user, session, request).call }

  def index
  end


  def show
    @user = User.find(event.user_id)
  end

  def new
  end

  def edit
  end

  # POST /events
  # POST /events.json
  def create
    self.event = Event.new(event_params.merge(:user_id => current_user.id))

    respond_to do |format|
      if event.save
        format.html { redirect_to event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: event }
      else
        format.html { render :new }
        format.json { render json: event.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if event.update(event_params)
        format.html { redirect_to event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: event }
      else
        format.html { render :edit }
        format.json { render json: event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def map
    self.events = Event.near(my, 50).decorate
  end
  
  protected

  def search_params
    # Ensure the user can only browse or search their own orders
    params[:search] || {}
  end
  
  private
  def is_owner
    user = User.find(event.user_id)
    unless current_user == user
      redirect_to(events_url, {:flash => { :error => "You are not allowed to edit this event." }})
    end
  end
    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :description, :time, :location, :photo, :category_id)
    end
  
  def get_proper_events
    if search_params.any?
      EventSearch.new(search_params).results
    else
      Event.all
    end
  end
end
