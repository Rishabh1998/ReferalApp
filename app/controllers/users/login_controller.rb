module Users
    class LoginController < ApplicationController
        def create
            @user = User.find_by(email: login_params[:email])
            if @user && @user.valid_password?(login_params[:password])
                token = @user.generate_jwt
                render json: {user: @user, token: token}, status: :ok
            else
                render json: { errors: "Invalid email or password" }, status: :unauthorized
            end
        end

        private
        def login_params
            params.require(:user).permit(:email, :password)
        end
    end
end