class UsersController < ApplicationController

    def index
        users=User.all
        render json:users
    end

    def create
        user=User.create!(user_params)
        render json: user, status: :created
    end

    def show
      render json:find_user_by_id
    end

    def update
        user=find_user_by_id
        user.update(user_params)
        render json:user
    end

    def destroy
        user=find_user_by_id
        if user
            user.destroy
            head :no_content
        else
            render json:{error:"user not found"}, status: :not_found
        end
    end

    private
    def user_params
        params.permit(:username,:password,:password_confirmation)
    end

    def find_user_by_id
      User.find(params[:id])
    end
end
