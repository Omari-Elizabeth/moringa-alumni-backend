class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :likes, :user_id, :image

  def image
    Rails.application.routes.url_helpers.rails_blob_path(object.image, only_path: true)
  
  end


  has_many :comments

end
  
