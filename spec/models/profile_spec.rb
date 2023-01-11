require 'rails_helper'

RSpec.describe Profile, type: :model do
  DatabaseCleaner.strategy=:truncation
    before(:each) do
      DatabaseCleaner.clean
    end
  
    after(:all) do
      DatabaseCleaner.clean
    end


      describe "Profile properties" do
        it "Expects Profile to have the following fields:" do
          expect(Profile.new.attributes).to include("fname","lname","cohort","birthday","user_id","profession","avatar","gender")
        end
      end


      describe "profile:" do
        it "expects cohort to include either DS or SD" do
          user=User.create(username:"james",password_digest:"samplepwd")
          profile=Profile.create(fname:"fname",lname:"lname",gender:"male",cohort:"sd2022",birthday:"5th June" ,profession:"sw engineer",avatar:"https://encrypted-tbn0.gstatic.com/images",user_id:user.id)
          profile2=Profile.create(fname:"fname",lname:"lname",gender:"male",cohort:"ds2022",birthday:"5th June" ,profession:"sw engineer",avatar:"https://encrypted-tbn0.gstatic.com/images",user_id:user.id)
          profile3=Profile.create(fname:"fname",lname:"lname",gender:"male",cohort:"software2022",birthday:"5th June" ,profession:"sw engineer",avatar:"https://encrypted-tbn0.gstatic.com/images",user_id:user.id)
          expect(profile).to be_valid
          expect(profile2).to be_valid
          expect(profile3).to be_invalid
        end
        
        it "expects gender to be either male or female" do
          user=User.create(username:"Njenga",password_digest:"testpwd")
          profile=Profile.create(fname:"fname",lname:"lname",gender:"male",cohort:"sd2022",birthday:"5th June" ,profession:"sw engineer",avatar:"https://encrypted-tbn0.gstatic.com/images",user_id:user.id)
          profile2=Profile.create(fname:"fname",lname:"lname",gender:"female",cohort:"sd2022",birthday:"5th June" ,profession:"sw engineer",avatar:"https://encrypted-tbn0.gstatic.com/images",user_id:user.id)
          profile3=Profile.create(fname:"fname",lname:"lname",gender:"other",cohort:"sd2022",birthday:"5th June" ,profession:"sw engineer",avatar:"https://encrypted-tbn0.gstatic.com/images",user_id:user.id)
          expect(profile).to be_valid
          expect(profile2).to be_valid
          expect(profile3).to be_invalid
          
        end
      end
end
