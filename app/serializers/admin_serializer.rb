class AdminSerializer < ActiveModel::Serializer
  attributes :id, :username, :password_digest
  
  # has_many :announcements
end