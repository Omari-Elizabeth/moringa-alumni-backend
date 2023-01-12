require "rails_helper"

RSpec.describe Post, type: :model do
    DatabaseCleaner.strategy=:truncation
      before(:each) do
        DatabaseCleaner.clean
      end
    
      after(:all) do
        DatabaseCleaner.clean
      end


describe "association" do
  it {should have_many(:comments).class_name("Comment")}

end

describe "validation" do
  it {should validate_presence_of(:image)}
end
end

