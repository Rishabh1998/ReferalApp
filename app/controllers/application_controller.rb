class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token

    def authenticate
        if request.headers['token'].present?
            token = request.headers['token']
            begin
                payload = JWT.decode(token, 'c880a82c45b11015ee1b244c01628b94cb61c6a14672a5be42a3f4db26bb3e985f5944773655971b987e46604ad7643987ad7ff946c887d8841dc62b9e461ee0').first
                @current_user = User.find(payload['id'])
            rescue JWT::ExpiredSignature
                render json: { errors: "Please login!" }, status: :unauthorized
            rescue JWT::VerificationError, JWT::DecodeError
                render json: { errors: "Invalid Authentication" }, status: :unauthorized
            end
        else
            render json: { errors: "No Authentication Found" }, status: :unauthorized
        end
    end
end
