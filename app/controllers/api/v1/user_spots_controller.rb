class Api::V1::UserSpotsController < ApplicationController
    def index
        @user_spots = UserSpot.all
        render json: @user_spots
    end

    def show
        @user_spot = UserSpot.find_by(id: params[:id])
        render json: @user_spot
    end

    def create
        
        @user_spot = UserSpot.create(user_spot_params)
        if @user_spot.valid?
            render json: { user_spot: @user_spot }, status: :created
        else
            render json: { error: 'Failed to save the user_spot' }, status: :not_accepted
        end
    end

    def edit
        @user_spot = UserSpot.find_by(id: params[:id])
        render json: @user_spot
    end

    def update
        @user_spot = UserSpot.find_by(id: params[:id])
        @user_spot.update(user_params)
        if @user_spot.valid?
            render json: { user_spot: @user_spot }
        else
            render json: { error: 'Update Not Successful'}
        end
    end

    def delete
        user_spot = UserSpot.find_by(id: params[:id])
        user_spot.destroy
        flash[:warning] = "UserSpot Successfully Deleted"
    end

    private
    def user_spot_params
        params.require(:user_spot).permit(:user_id, :spot_id)
    end
end
