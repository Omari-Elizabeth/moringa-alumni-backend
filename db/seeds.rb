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

Admin.create(username: "MainaVincent", password: "54321")
Admin.create(username: "VincentMaina", password: "12345")

Announcement.create(title: "Career Fair", content: "We'll have our annual career fair on 16th January at the school premises", admin_id: 1)
Announcement.create(title: "Career Fair", content: "We'll have our annual career fair on 16th January at the school premises", admin_id: 2)
Announcement.create(title: "Career Fair", content: "We'll have our annual career fair on 16th January at the school premises", admin_id: 1)
Announcement.create(title: "Career Fair", content: "We'll have our annual career fair on 16th January at the school premises", admin_id: 2)
Announcement.create(title: "Career Fair", content: "We'll have our annual career fair on 16th January at the school premises", admin_id: 1)


15.times do
    Post.create(
        title: Faker::Lorem.sentence(word_count: 3),
        content: Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4),
        likes:rand(1..4),
        user_id:rand(1..4)

    )
end

10.times do
    Comment.create(
        comment_msg: Faker::Lorem.sentence(word_count: 3),
        user_id:rand(1..4),
        post_id:rand(1..4)
    )
end 

puts "✅ Done seeding!"
