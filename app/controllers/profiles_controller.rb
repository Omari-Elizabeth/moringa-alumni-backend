class ProfilesController < ApplicationController

    def index
        profiles=Profile.all
        render json:profiles
    end

    def create
        profile=Profile.create!( profile_params)
        render json: profile, status: :created
    end

    private
    def profile_params
      params.permit(:fname,:lname,:gender,:cohort,:birthday,:profession,:avatar,:user_id)
    end

end
