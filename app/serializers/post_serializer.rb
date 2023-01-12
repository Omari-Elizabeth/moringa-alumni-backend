class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :likes, :user_id

  has_many :comments
end
