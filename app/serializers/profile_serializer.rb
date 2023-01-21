class ProfileSerializer < ActiveModel::Serializer
  # attributes :id, :fname, :lname, :gender, :cohort, :birthday, :profession,:avatar_url
  attributes :id, :fname, :lname, :gender, :cohort, :birthday, :profession
  # belongs_to :user

  # def avatar_url
  #   object.avatar.url
  # end

  attribute :avatar_url do
    object.avatar.attached? ? 
    Rails.application.routes.url_helpers.rails_blob_path(object.avatar, only_path: true) : nil
  end

  
end
