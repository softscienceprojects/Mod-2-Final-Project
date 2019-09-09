class EventAttendeesController < ApplicationController

    def create
        @event = EventAttendee.create(user_id: session[:user_id], event_id: params[:id])
        redirect_to event_path(@event.event_id)
    end

end
