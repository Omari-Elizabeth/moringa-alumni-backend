class AdminLoginController < ApplicationController
    def create
        admin = Admin.find_by(username: params[:username])
        if admin&.authenticate(params[:password])
          token = encode_token(admin_id: admin.id)
          render json: {admin: admin, token: token}
        else
          render json: { errors: ["Invalid username or password"] }, status: :unauthorized
        end
    end
end
