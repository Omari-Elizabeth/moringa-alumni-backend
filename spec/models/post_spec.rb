require "rails_helper"

RSpec.describe Profile, type: :model do
    DatabaseCleaner.strategy=:truncation
      before(:each) do
        DatabaseCleaner.clean
      end
    
      after(:all) do
        DatabaseCleaner.clean
      end


RSpec.describe Post, type: :model do
  let(:user) { User.create(username: 'testuser') }
  let(:post) { Post.new(title: 'Test Post', content: 'This is a test post', likes: 0, user_id: user.id) }

  it 'has a valid factory' do
    expect(post).to be_valid
  end

  it 'is invalid without a title' do
    post.title = nil
    expect(post).to be_invalid
  end

  it 'is invalid without content' do
    post.content = nil
    expect(post).to be_invalid
  end

  it 'is invalid without a user_id' do
    post.user_id = nil
    expect(post).to be_invalid
  end

  it 'is invalid without likes' do
    post.likes = nil
    expect(post).to be_invalid
  end

  it 'is valid with a title, content, likes, and user_id' do
    expect(post).to be_valid
  end
end

