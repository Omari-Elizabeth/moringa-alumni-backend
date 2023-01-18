class Announcement < ApplicationRecord
    # belongs_to :admin

    validates :title, presence: true
    validates :content, length: {minimum: 50}
end
