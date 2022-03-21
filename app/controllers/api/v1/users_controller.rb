class Api::V1::UsersController < ApplicationController
    before_action :set_user, only: %i[show update destroy]
    def show
        render json: User.find(params[:id])
    end

    def destroy
        @user.destroy
        head 204
    end



    def update 
        if @user.update(user_params)
            render json: @user
        else 
            render json: @user, status: :unprocessable_entity
        end
    end    
    # POST /users
    def create
        @user = User.new(user_params)

        if @user.save
            render json: @user, status: :created
        else
            render json: @user, status: :unprocessable_entity
        end
    end

    private

    #Only allow a trusted parameter 'white list' through
    def user_params
        params.require(:user).permit(:email, :password)
    end

    def set_user
        @user = User.find(params[:id])
    end

end
