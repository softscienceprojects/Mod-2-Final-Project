class EventsController < ApplicationController
    before_action :find_event, only: [:show, :edit, :update, :destroy]

    def index
        @events = Event.all
    end

    def show

    end

    def new
        @event = Event.new
    end

    def create
        @event = Event.create(event_params)
        redirect_to event_path(@event)
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