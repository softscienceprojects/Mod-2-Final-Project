class VenuesController < ApplicationController
    before_action :find_venue, only: [:show]

    def index
        @venues = Venue.all
    end

    def show

    end

    def new
        @venue = Venue.new
    end

    def create
        @venue = Venue.create(venue_params)
        redirect_to venue_path(@venue)
    end

    private

    def find_venue
        @venue = Venue.find(params[:id])
    end

    def venue_params
        params.require(:venue).permit(:name, :address)
    end
end
