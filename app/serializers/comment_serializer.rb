class CommentSerializer < ActiveModel::Serializer
  attributes :id, :comment_msg, :user_id, :post_id

  belongs_to :user
end
