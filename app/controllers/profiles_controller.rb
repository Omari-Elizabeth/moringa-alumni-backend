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

    def update
        profile=find_profile_by_id

       if profile
        profile.update(profile_params)
        render json:profile
       else 
        render json:{error:"profile not found"}, status: :not_found
       end
       
    end

    def destroy
        profile=find_profile_by_id
        if profile
            profile.destroy
            head :no_content
        else
            render json:{error:"profile not found"}, status: :not_found
        end
    end


    private

    def profile_params
      params.permit(:fname,:lname,:gender,:cohort,:birthday,:profession,:avatar,:user_id)
    end

    def find_profile_by_id
        Profile.find(params[:id])
    end

end
