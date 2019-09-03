class Api::V1::JournalsController < ApplicationController
    skip_before_action :authorized, only: [:index, :show]

    def index
        @journals = Journal.all
        render json: @journals
    end

    def show
        @journal = Journal.find_by(id: params[:id])
        render json: @journal
    end

    def create
        
        @journal = Journal.create(journal_params)
        if @journal.valid?
            render json: { journal: @journal }, status: :created
        else
            render json: { error: 'Failed to save the journal' }, status: :not_accepted
        end
    end

    def edit
        @journal = Journal.find_by(id: params[:id])
        render json: @journal
    end

    def update
        @journal = Journal.find_by(id: params[:id])
        @journal.update(user_params)
        if @journal.valid?
            render json: { journal: @journal }
        else
            render json: { error: 'Update Not Successful'}
        end
    end

    def delete
        journal = Journal.find_by(id: params[:id])
        journal.destroy
        flash[:warning] = "Journal Successfully Deleted"
    end

    private
    def journal_params
        params.require(:journal).permit(:user_id, :spot_id, :date, :flow, :height, :pref_charc, :quality, :description)
    end
end
