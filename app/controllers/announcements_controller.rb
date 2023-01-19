class AnnouncementsController < ApplicationController
        rescue_from ActiveRecord::RecordInvalid, with: :render_unproccessable_entity_response
        rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    
        def index
            render json: Announcement.all, status: :ok
        end
    
        def show
            announcement = find_announcement
            render json: announcement, status: :ok
        end
    
        def create
            announcement = Announcement.create!(announcement_params)
            render json: announcement, status: :created
        end
    
        def update 
            announcement = find_announcement
            announcement.update!(announcement_params)
            render json: announcement, status: :ok
        end
    
        def destroy 
            announcement = find_announcement
            announcement.destroy!
            head :no_content, status: :no_content
        end
    
        private
    
        def render_unproccessable_entity_response
            render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
        end
    
        def record_not_found
            render json: {errors: "Record not found"}, status: :not_found
        end
    
        def find_announcement
            Announcement.find(params[:id])
        end
    
        def announcement_params
            params.permit(:title, :content, :admin_id, :announcement_image)
        end
    
end
