module Users
    class UsersController < ApplicationController
        before_action :authenticate 
        before_action :validate_user

        def send_referal
            if @current_user.present?
                ReferalMailer.send_referal_email(@current_user, params[:referal_user]).deliver_now
                render json: { message: "Email sent" }, status: :ok
            else
                render json: { errors: "User not found" }, status: :unprocessable_entity
            end
        end

        private
        def validate_user
            if @current_user.id != params[:id].to_i
                render json: { errors: "Unauthorized" }, status: :unauthorized
            end
        end
    end
end