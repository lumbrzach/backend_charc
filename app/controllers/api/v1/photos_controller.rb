class Api::V1::PhotosController < ApplicationController
    skip_before_action :authorized, only: [:index, :show]

    def index
        @photos = Photo.all
        render json: @photos
    end

    def show
        @photo = Photo.find_by(id: params[:id])
        render json: @photo
    end

    def create
        @photo = Photo.create(photo_params)
        if @photo.valid?
            render json: { photo: @photo }, status: :created
        else
            render json: { error: 'Failed to save the photo' }, status: :not_accepted
        end
    end

    def edit
        @photo = Photo.find_by(id: params[:id])
        render json: @photo
    end

    def update
        @photo = Photo.find_by(id: params[:id])
        @photo.update(photo_params)
        if @photo.valid?
            render json: { photo: @photo }
        else
            render json: { error: 'Update Not Successful'}
        end
    end

    def delete
        photo = Photo.find_by(id: params[:id])
        photo.destroy
        flash[:warning] = "Photo Successfully Deleted"
    end

    private
    def photo_params
        params.require(:photo).permit(:user_id, :spot_id, :source, :comment)
    end
end
