class AdminsController < ApplicationController

    def index
        admin=Admin.all
        render json: admin
    end

    def show
        admin = find_admin
        render json: admin, status: :ok
    end

    def create
        admin=Admin.create(admin_params)
        render json: admin, status: :created
    end

    def update 
        admin = find_admin
        admin.update!(admin_params)
        render json: admin, status: :ok
    end

    private

    def find_admin
        Admin.find(params[:id])
    end

    def admin_params
        params.permit(:username, :password,:password_confirmation)
    end
end