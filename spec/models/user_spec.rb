require 'rails_helper'

RSpec.describe User, type: :model do
    DatabaseCleaner.strategy=:truncation
    before(:each) do
      DatabaseCleaner.clean
    end
  
    after(:all) do
      DatabaseCleaner.clean
    end

    describe "User properties" do
        it "verifies that User has username and password" do
          expect(User.new.attributes).to include("username","password_digest")
        end
    end

    describe "validations" do
        describe "username:" do
          it "expects username to be present" do
            expect(User.create(password_digest:"2022")).to be_invalid
            expect(User.create(username:"Techninja",password_digest:"2022")).to be_valid
          end
    
          it "expects username to be unique" do
            User.create(username:"Techninja",password_digest:"mypwd")
            expect(User.create(username:"Techninja",password_digest:"pwdhere")).to be_invalid
          end
    
          it "expects username to have a minimum length of 3" do
            expect(User.create(username:"us",password_digest:"pwdhere")).to be_invalid
            expect(User.create(username:"unicorn",password_digest:"anotherpwd")).to be_valid
          end
        end

        describe "password:" do
          it "expects password to have a minimum char of 4" do
            expect(User.create(username:"cool name",password_digest:"pwd")).to be_invalid
            expect(User.create(username:"cool name",password_digest:"longpwd")).to be_valid
           end
        end

    end

      

end
