require "rails_helper"

RSpec.describe Comment, type: :model do
    DatabaseCleaner.strategy=:truncation
      before(:each) do
        DatabaseCleaner.clean
      end
    
      after(:all) do
        DatabaseCleaner.clean
      end

      require "rails_helper"

      RSpec.describe Comment, type: :model do
        describe 'validations' do
          it 'is valid with a comment_message, user_id, and post_id' do
            user = User.create(email: 'example@example.com', password: 'password')
            post = Post.create(title: 'Example Post')
            comment = Comment.new(comment_message: 'Great post!', user_id: user.id, post_id: post.id)
            
            expect(comment).to be_valid
          end
        end
        
        describe 'associations' do
          it 'belongs to a user' do
            assc = described_class.reflect_on_association(:user)
            expect(assc.macro).to eq :belongs_to
          end
      
          it 'belongs to a post' do
            assc = described_class.reflect_on_association(:post)
            expect(assc.macro).to eq :belongs_to
          end
        end
      end
    end
      