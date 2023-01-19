require 'rails_helper'

RSpec.describe "Comments", type: :request do
  
  DatabaseCleaner.strategy=:truncation
  before(:each) do
    DatabaseCleaner.clean
  end

  after(:all) do
    DatabaseCleaner.clean
  end

  describe "/comments" do
    describe "GET /index" do
      it "returns an array with status 200" do
        get "/comments"
        expect(response.status).to be(200)
        expect(JSON.parse(response.body)).to be_an(Array)
      end
    end

    describe "POST /index" do
      it "creates a new comment and returns it" do 
        user=User.create(username:"Njenga",password_digest:"testpwd")
        # img= File.open(File.join(Rails.root,'/spec/support/assets/test_image.jpg')), filename: 'test_image.jpg', content_type: 'image/jpg'
         post=Post.create(title:"This is a post", content:"my content",likes:10,user_id:user.id)
        #post=Post.new
        comment=Comment.create(comment_msg:"i really like this",post_id:post.id,user_id:user.id)
        post "/comments",params:{comment_msg:"i really like this",post_id:post.id,user_id:user.id}
        expect(response.status).to eq(201)
        expect(JSON.parse(response.body)["comment_msg"]).to eq("i really like this")
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

    describe "PATCH/profiles/[:id]" do
      it "expects /profiles to update and return an object" do 
         user=User.create(username:"Njenga",password:"pwd123",password_confirmation:"pwd123")
         profile=Profile.create(fname:"fname",lname:"lname",gender:"male",cohort:"sd2022",birthday:"5th June" ,profession:"sw engineer",avatar:"https://encrypted-tbn0.gstatic.com/images",user_id:user.id)
         patch "/profiles/#{profile.id}", params:{fname:"fname",lname:"lname",gender:"male",cohort:"sd2022",birthday:"5th June" ,profession:"sw engineer",avatar:"https://encrypted-tbn0.gstatic.com/images",user_id:user.id}
         expect(response.status).to be(200)
         expect(JSON.parse(response.body)["fname"]).to eq("fname")
      end
    end

    describe 'DELETE /profiles/[:id]' do
      it 'will delete a profile' do
        user = User.create(username:"James",password: "deletepwd", password_confirmation:"deletepwd")
        profile=Profile.create(fname:"fname",lname:"lname",gender:"male",cohort:"sd2022",birthday:"5th June" ,profession:"sw engineer",avatar:"https://encrypted-tbn0.gstatic.com/images",user_id:user.id)
        delete "/profiles/#{profile.id}"
        expect(response.status).to eq(204)
      end
    end

  end


end

