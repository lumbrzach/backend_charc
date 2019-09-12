class Api::V1::EventsController < ApplicationController
    skip_before_action :authorized, only: [:index, :show]

    def index
        @events = Event.all
        render json: @events.to_json( include: [:spots, :users] )
    end

    def show
        @event = Event.find_by(id: params[:id])
        render json: @event.to_json( include: [:spots, :users])
    end

    def create

        @event = Event.create(event_params)
        if @event.valid?
            EventSpot.create(event_id: @event.id, spot_id: params[:spot_id])
            render json: { event: @event }, include: ['users', 'spots'], status: :created
        else
            render json: { error: 'Failed to save the event' }, status: :not_accepted
        end
    end

    def edit
        @event = Event.find_by(id: params[:id])
        render json: @event
    end

    def update
        @event = Event.find_by(id: params[:id])
        @event.update(user_params)
        if @event.valid?
            render json: { event: @event }
        else
            render json: { error: 'Update Not Successful'}
        end
    end

    def delete
        event = Event.find_by(id: params[:id])
        event.destroy
        flash[:warning] = "Event Successfully Deleted"
    end

    private
    def event_params
        params.require(:event).permit(:name, :location, :description, :date, :completed, :alt_spot_1, :alt_apot_2, :alt_spot_3, :alt_spot_4)
    end
end
