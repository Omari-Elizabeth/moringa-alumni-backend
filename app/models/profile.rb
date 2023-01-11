class Profile < ApplicationRecord
    belongs_to :user 

    # validates :my_field, format: { with: /.+sd.+/ }

    validates :cohort,format: { with: /.*(sd|ds).*/i }
    # validates :cohort,inclusion:{in:["sd","ds"]}

    validates :gender,inclusion:{in:["male","female"]}
    
end
