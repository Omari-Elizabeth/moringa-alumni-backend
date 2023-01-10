require "rails_helper"

RSpec.describe Post, type: :model do
    describe "Post Properties" do
        it "verifies post properties" do 
            expect(Post.new.attributes).to include("title", "content", "likes", "user_id")
        end
    end
end