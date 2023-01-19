class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :fname, :lname, :gender, :cohort, :birthday, :profession, :avatar_url
  belongs_to :user

  def avatar_url
    object.avatar.url
  end
  
end
