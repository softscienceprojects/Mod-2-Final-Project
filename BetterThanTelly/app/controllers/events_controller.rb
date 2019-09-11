class EventsController < ApplicationController
    before_action :find_event, only: [:show, :edit, :update, :destroy]
    before_action :require_login, only: [:show]

    def index
        #@events = Event.all.order(event_date: :asc )
        # @events = Event.all_future_events
        @events = Event.all_future_events_in_date_order
    end


    def show
        #@attend = EventAttendee.new
    end


    def new
        @event = Event.new
        @user = session[:user_id]
    end

    def create
        @event = Event.create(event_params)
        if @event.valid?
            redirect_to event_path(@event)
        else 
            flash[:errors] = @event.errors.full_messages
            redirect_to new_event_path
        end
    end

    def edit

    end

    def update
        @event.update(event_params)
        redirect_to event_path(@event)
    end

    def destroy
        @event.destroy
        redirect_to events_path
    end

    private

    def find_event
        @event=Event.find(params[:id])
    end

    def event_params
        params.require(:event).permit(:title, :event_date, :event_time, :desription, :category_id, :venue_id, :user_id)
    end

end
