class User < ApplicationRecord
    has_secure_password
    validates :username,presence:true,uniqueness:true,length:{minimum:3}
    validates :password_digest,length:{minimum:4}
end