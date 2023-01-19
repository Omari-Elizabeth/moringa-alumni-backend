class AnnouncementSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :announcement_image_url
  
  def announcement_image_url
    object.announcement_image.url
  end

end
