class AnnouncementSerializer < ActiveModel::Serializer
  attributes :id, :title, :content
  # , :admin_id
end
