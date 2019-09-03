class Api::V1::SpotsController < ApplicationController
    skip_before_action :authorized, only: [:index, :show]

    def index
        @spots = Spot.all
        render json: @spots.to_json( include: [:events, :photos, :journals, :users] )
    end

    def show
        @spot = Spot.find_by(id: params[:id])
        render json: @spot.to_json( include: [:events, :photos, :journals, :users])
    end

    def create
        @spot = Spot.create(spot_params)
        if @spot.valid?
            render json: { spot: @spot }, status: :created
        else
            render json: { error: 'Failed to save the spot' }, status: :not_accepted
        end
    end

    def edit
        @spot = Spot.find_by(id: params[:id])
        render json: @spot
    end

    def update
        @spot = Spot.find_by(id: params[:id])
        @spot.update(spot_params)
        if @spot.valid?
            render json: { spot: @spot }
        else
            render json: { error: 'Update Not Successful'}
        end
    end

    def delete
        spot = Spot.find_by(id: params[:id])
        spot.destroy
        flash[:warning] = "Spot Successfully Deleted"
    end

    private
    def spot_params
        params.require(:spot).permit(:name, :lat, :long, :country, :city, :state, :quality, :river, :river_section, :gauge_url, :min_flow, :max_flow, :ideal_flow, :description, :water_temp, :current_cfs, :current_height, :gauge_name, :gauge_num, :region)
    end
end
