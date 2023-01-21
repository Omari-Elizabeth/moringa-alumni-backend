class AdminSerializer < ActiveModel::Serializer
  attributes :id, :username
  
  # has_many :announcements
end