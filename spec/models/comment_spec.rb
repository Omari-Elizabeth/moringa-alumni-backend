require "rails_helper"

RSpec.describe Comment, type: :model do
    DatabaseCleaner.strategy=:truncation
      before(:each) do
        DatabaseCleaner.clean
      end
    
      after(:all) do
        DatabaseCleaner.clean
      end
  
     
      describe 'association' do
        it {should belong_to(:post).class_name("Post")}

      end

     
      end
    
    
      