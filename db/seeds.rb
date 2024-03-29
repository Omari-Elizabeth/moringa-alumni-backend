# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "🌱 Seeding Greatness!..."

Admin.destroy_all 
Announcement.destroy_all
Post.destroy_all
Comment.destroy_all
Profile.destroy_all

Admin.create(username: "MainaVincent", password: "54321")
Admin.create(username: "VincentMaina", password: "12345")

User.create(username: "Chiveli", password: "password")
User.create(username: "Cate", password: "password")
User.create(username: "James", password: "password")
User.create(username: "Purity", password: "password")

Announcement.create(title: "Career Fair", content: "We'll have our annual career fair on 16th January at the school premises")
Announcement.create(title: "Career Fair", content: "We'll have our annual career fair on 16th January at the school premises")
Announcement.create(title: "Career Fair", content: "We'll have our annual career fair on 16th January at the school premises")
Announcement.create(title: "Career Fair", content: "We'll have our annual career fair on 16th January at the school premises")
Announcement.create(title: "Career Fair", content: "We'll have our annual career fair on 16th January at the school premises")

image = File.open(File.join(Rails.root,"/spec/support/assets/test_image.jpg")).read

15.times do
    post = Post.create(
        title: Faker::Lorem.sentence(word_count: 3),
        content: Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4),
        likes:rand(1..4),
        user_id:rand(1..4),
    )
    post.image.attach(io: File.open(File.join(Rails.root,"/spec/support/assets/test_image.jpg")), filename: 'test_image.jpg')
end

10.times do
    Comment.create(
        comment_msg: Faker::Lorem.sentence(word_count: 10),
        user_id:rand(1..4),
        post_id:rand(1..4)
    )
end 

Profile.create(fname:"Purity",lname:"lname",gender:"female",cohort:"sd2022",birthday:"5th June" ,profession:"sw engineer",avatar:"https://encrypted-tbn0.gstatic.com/images",user_id:rand(1..4))
Profile.create(fname:"James",lname:"lname",gender:"male",cohort:"sd2022",birthday:"5th June" ,profession:"sw engineer",avatar:"https://encrypted-tbn0.gstatic.com/images",user_id:rand(1..4))
Profile.create(fname:"Chiveli",lname:"lname",gender:"male",cohort:"sd2022",birthday:"5th June" ,profession:"sw engineer",avatar:"https://encrypted-tbn0.gstatic.com/images",user_id:rand(1..4))
Profile.create(fname:"Cate",lname:"lname",gender:"female",cohort:"ds2022",birthday:"5th June" ,profession:"sw engineer",avatar:"https://encrypted-tbn0.gstatic.com/images",user_id:rand(1..4))
Profile.create(fname:"Liz",lname:"lname",gender:"female",cohort:"ds2022",birthday:"5th June" ,profession:"sw engineer",avatar:"https://encrypted-tbn0.gstatic.com/images",user_id:rand(1..4))
Profile.create(fname:"Vin",lname:"lname",gender:"male",cohort:"ds2022",birthday:"5th June" ,profession:"sw engineer",avatar:"https://encrypted-tbn0.gstatic.com/images",user_id:rand(1..4))

puts "✅ Done seeding!"
