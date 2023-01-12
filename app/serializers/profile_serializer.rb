class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :fname, :lname, :gender, :cohort, :birthday, :profession, :avatar
  belongs_to :user
end
