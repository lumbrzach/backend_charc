class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create, :index, :show]

    def profile
        render json: { user: UserSerializer.new(current_user) }, status: :accepted
    end

    def index
        @users = User.all
        render json: @users.to_json( include: [:events, :photos, :journals, :spots] )
    end

    def show
        @user = User.find_by(id: params[:id])
        render json: @user.to_json( include: [:events, :photos, :journals, :spots])
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            @token = encode_token(user_id: @user.id)
            render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
        else
            render json: { error: 'failed to create user' }, status: :not_acceptable
        end
    end
    
    # def profile
    #     render json: { user: current_user }, status: :accepted
    # end

    def edit
        @user = User.find_by(id: params[:id])
        render json: @user
    end

    def update
        @user = User.find_by(id: params[:id])
        @user.update(user_params)
        if @user.valid?
            render json: { user: @user }
        else
            render json: { error: 'Update Not Successful'}
        end
    end

    def delete
        user = User.find_by(id: params[:id])
        user.destroy
        flash[:warning] = "User Successfully Deleted"
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :avatar, :location, :email, :first_name, :last_name)
    end
end
