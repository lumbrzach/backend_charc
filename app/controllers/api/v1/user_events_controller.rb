class Api::V1::UserEventsController < ApplicationController
    def index
        @user_events = UserEvent.all
        render json: @user_events
    end

    def show
        @user_event = UserEvent.find_by(id: params[:id])
        render json: @user_event
    end

    def create
        
        @user_event = UserEvent.create(event_id: user_event_params[:event_id], user_id: current_user.id)
        if @user_event.valid?
            @event = Event.find_by(id: user_event_params[:event_id])
            render json: { event: @event }, include: ['users', 'spots'], status: :created
        else
            render json: { error: 'Failed to save the user_event' }, status: :not_accepted
        end
    end

    def edit
        @user_event = UserEvent.find_by(id: params[:id])
        render json: @user_event
    end

    def update
        @user_event = UserEvent.find_by(id: params[:id])
        @user_event.update(user_params)
        if @user_event.valid?
            render json: { user_events: @user_events }
        else
            render json: { error: 'Update Not Successful'}
        end
    end

    def delete
        user_event = UserEvent.find_by(id: params[:id])
        user_event.destroy
        flash[:warning] = "UserEvent Successfully Deleted"
    end




    private
    def user_event_params
        params.require(:user_event).permit(:user_id, :event_id)
    end
end
