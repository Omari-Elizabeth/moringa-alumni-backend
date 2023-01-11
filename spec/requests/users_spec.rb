require 'rails_helper'

RSpec.describe "Users", type: :request do

  DatabaseCleaner.strategy=:truncation
  before(:each) do
    DatabaseCleaner.clean
  end

  after(:all) do
    DatabaseCleaner.clean
  end

  describe "/users" do
    describe "GET /index" do
      it "returns an array with status 200" do
        get "/users"
        expect(response.status).to be(200)
        expect(JSON.parse(response.body)).to be_an(Array)
      end
   end

    describe "POST /index" do
      it "creates a new record and returns it" do 
        post "/users",params:{username:"Njenga",password:"jwiki"}
        expect(response.status).to be(201)
        expect(JSON.parse(response.body)["username"]).to eq("Njenga")
      end
    end 
  end
 
  describe "/users/[:id]" do
    describe "GET/users/[:id]" do
      it "returns an object with status given an id" do
        user=User.create(username:"Njenga",password_digest:"Njenga")
        get "/users/#{user.id}"
        expect(response.status).to be(200)
        expect(JSON.parse(response.body)["id"]).to be(user.id)
      end
    end

    describe "PATCH/users/[:id]" do
     it "expects /users to update and return an object" do 
        user=User.create(username:"Njenga",password:"pwd123",password_confirmation:"pwd123")
        patch "/users/#{user.id}", params:{username:"testname",password:user.password}
        expect(response.status).to be(200)
        expect(JSON.parse(response.body)["username"]).to eq("testname")
     end
    end

    describe 'DELETE /users/[:id]' do
      it 'will delete a user' do
        user = User.create(username:"James",password: "deletepwd", password_confirmation:"deletepwd")
        delete "/users/#{user.id}"
        expect(response.status).to eq(204)
      end
    end
  end

  # describe 'LOGIN /user' do
  #   it 'will LOGIN a user' do
  #     post "/login"
  #     expect(response.status).to eq(204)
  #   end
  # end


end
