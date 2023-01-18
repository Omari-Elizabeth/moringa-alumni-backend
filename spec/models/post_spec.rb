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

#describe "validation" do
 # it {should validate_presence_of(:image)}
 describe 'Attachment' do
  it 'is valid  ' do
    subject.image.attach(io: File.open(File.join(Rails.root,'/spec/support/assets/test_image.jpg')), filename: 'test_image.jpg', content_type: 'image/jpg')
    expect(subject.image).to be_attached
  end
end
end

