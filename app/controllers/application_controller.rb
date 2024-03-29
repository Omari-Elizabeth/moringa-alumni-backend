class ApplicationController < ActionController::API
    # skip_before_action :verify_authenticity_token

    # include ActionController::Cookies

    def encode_token(payload)
        JWT.encode(payload,"secret_key")
    end

    def decode_token
        auth_header=request.headers["Authorization"]

        if auth_header
            token=auth_header.split("")[1]
            begin
                JWT.decode(token,"secret",true,algorithm:"HS256")
            rescue JWT::DecodeError
                nil
            end
        end
    end

    def authorized_user
        decoded_token=decode_token()
        if decoded_token
            user_id=decoded_token[0]["user_id"]
            user=User.find(id:user_id)
        end
    end

    def authorized_admin
        decoded_token=decode_token()
        if decode_token
            admin_id=decoded_token[0]["admin_id"]
            admin=Admin.find(id:admin_id)
        end
    end

    def logged_in?
        !!authorized_user||!!authorized_admin
    end

    def authorize
        render json:{message:"You have to log in"}, status: :unauthorized unless logged_in?
    end
end

