class User < ApplicationRecord
    has_secure_password
    validates :username,presence:true,uniqueness:true,length:{minimum:3}
    validates :password_digest,length:{minimum:4}
    
    has_many :posts
    has_many :comments
    has_one :profile
end
