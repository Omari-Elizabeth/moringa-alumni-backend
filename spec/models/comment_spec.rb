require "rails_helper"

RSpec.describe Comment, type: :model do
    DatabaseCleaner.strategy=:truncation
      before(:each) do
        DatabaseCleaner.clean
      end
    
      after(:all) do
        DatabaseCleaner.clean
      end

      it 'belongs to a user' do
        subject { described_class.new }
        puts described_class.reflect_on_all_association
        assc = described_class.reflect_on_all_association
        expect(assc.macro).to contain(:belongs_to)
      end

        # describe 'validations' do
        #   it 'is valid with a comment_msg, user_id, and post_id' do
        #     user = User.create(username: 'purity', password: 'password')
        #     post = Post.create(title: 'Example Post')
        #     comment = Comment.new(comment_msg: 'Great post!', user_id: user.id, post_id: post.id)
            
        #     expect(comment).to be_valid
        #   end
        # end
        
        # describe Comment,type: :model do
          
      
        #   it 'belongs to a post' do
        #     subject { described_class.new }
        #     assc = described_class.reflect_on_association(:posts)
        #     expect(assc.macro).to eq :belongs_to
        #   end
        # end
      end
    
    
      