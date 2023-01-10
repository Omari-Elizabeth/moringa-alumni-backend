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
  end
end
