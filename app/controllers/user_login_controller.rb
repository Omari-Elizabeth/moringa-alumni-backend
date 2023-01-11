class UserLoginController < ApplicationController

    # POST/login-user 
    def create
        user=User.find_by(username:user_params[:username])
        if user&.authenticate(params[:password])
            token=encode_token(user_id:user.id)
            render json:{user:user,token:token}, status: :ok
        else
         render json: {error:"Invalid username or password"}, status: :unprocessable_entity
        end
    end

    private
    def user_params
        params.permit(:username,:password,:password_confirmation)
    end

end
