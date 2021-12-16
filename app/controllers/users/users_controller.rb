module Users
    class UsersController < ApplicationController
        before_action :authenticate 
        
        def send_referal
            @user = User.find(params[:id])
            if @user
                # @user.send_referal_email
                render json: { message: "Email sent" }, status: :ok
            else
                render json: { errors: "User not found" }, status: :unprocessable_entity
            end
        end
    end
end