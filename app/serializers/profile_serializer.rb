class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :fname, :lname, :gender, :cohort, :birthday, :profession, :avatar
end
