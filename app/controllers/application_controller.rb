class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token

    def authenticate
        if request.headers['token'].present?
            token = request.headers['token']
            begin
                payload = JWT.decode(token, Rails.application.secrets.secret_key_base).first
                @current_user = User.find(payload['id'])
            rescue JWT::ExpiredSignature
                render json: { errors: "Please login!" }, status: :unauthorized
            rescue JWT::VerificationError, JWT::DecodeError
                render json: { errors: "Invalid Authentication" }, status: :unauthorized
            end
        else
            render json: { errors: "Invalid Authentication" }, status: :unauthorized
        end
    end
end
