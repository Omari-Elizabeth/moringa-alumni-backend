class Post < ApplicationRecord
    #validates :image, presence: true
    has_many :comments, dependent: :destroy
    has_one_attached :image, :dependent => :destroy
    #belongs_to :use

end
