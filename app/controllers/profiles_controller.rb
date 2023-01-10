class ProfilesController < ApplicationController

    def index
        profiles=Profile.all
        render json:profiles
    end

    def create
        profile=Profile.create!( profile_params)
        render json: profile, status: :created
    end

    def show
        render json:find_profile_by_id
    end

    private

    def profile_params
      params.permit(:fname,:lname,:gender,:cohort,:birthday,:profession,:avatar,:user_id)
    end

    def find_profile_by_id
        Profile.find(params[:id])
    end

end
