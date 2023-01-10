require 'rails_helper'

RSpec.describe "Profiles", type: :request do
  
  DatabaseCleaner.strategy=:truncation
  before(:each) do
    DatabaseCleaner.clean
  end

  after(:all) do
    DatabaseCleaner.clean
  end

  describe "/profiles" do
    describe "GET /index" do
      it "returns an array with status 200" do
        get "/profiles"
        expect(response.status).to be(200)
        expect(JSON.parse(response.body)).to be_an(Array)
      end
    end

    describe "POST /index" do
      it "creates a new record and returns it" do 
        user=User.create(username:"Njenga",password_digest:"testpwd")
        post "/profiles",params:{fname:"fname",lname:"lname",gender:"male",cohort:"sd2022",birthday:"5th June" ,profession:"sw engineer",avatar:"https://encrypted-tbn0.gstatic.com/images",user_id:user.id}
        expect(response.status).to be(201)
        expect(JSON.parse(response.body)["fname"]).to eq("fname")
      end
    end 
  end

  describe "/profiles/[:id]" do
    describe "GET/profiles/[:id]" do
      it "returns an object with status given an id" do
        user=User.create(username:"Njenga",password_digest:"testpwd")
        profile=Profile.create(fname:"fname",lname:"lname",gender:"male",cohort:"sd2022",birthday:"5th June" ,profession:"sw engineer",avatar:"https://encrypted-tbn0.gstatic.com/images",user_id:user.id)
        get "/profiles/#{profile.id}"
        expect(response.status).to be(200)
        expect(JSON.parse(response.body)["id"]).to be(profile.id)
      end
    end
  end


end
