class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :likes, :user_id
end
