class Announcement < ApplicationRecord
    # belongs_to :admin
    has_one_attached :announcement_image

    validates :title, presence: true
    validates :content, length: {minimum: 50}
end
