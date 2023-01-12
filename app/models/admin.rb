class Admin < ApplicationRecord
    # has_secure_password

    has_many :announcements

    validates :username, presence: true, uniqueness: true 
end