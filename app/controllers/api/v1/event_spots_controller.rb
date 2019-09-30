class Api::V1::EventSpotsController < ApplicationController
    def index
        @event_spots = EventSpot.all
        render json: @event_spots
    end

    def show
        @event_spot = EventSpot.find_by(id: params[:id])
        render json: @event_spot
    end

    def create
        
        @event_spot = EventSpot.create(event_spot_params)
        if @event_spot.valid?
            render json: { event_spot: @event_spot }, status: :created
        else
            render json: { error: 'Failed to save the event' }, status: :not_accepted
        end
    end

    def edit
        @event_spot = EventSpot.find_by(id: params[:id])
        render json: @event_spot
    end

    def update
        @event_spot = EventSpot.find_by(id: params[:id])
        @event_spot.update(user_params)
        if @event_spot.valid?
            render json: { event_spot: @event_spot }
        else
            render json: { error: 'Update Not Successful'}
        end
    end

    def delete
        event_spot = EventSpot.find_by(id: params[:id])
        event_spot.destroy
        flash[:warning] = "EventSpot Successfully Deleted"
    end

    private
    def event_spot_params
        params.require(:event_spot).permit(:event_id, :spot_id)
    end
end
