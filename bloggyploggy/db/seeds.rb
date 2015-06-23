require 'faker'

5.times do

  post = Post.new
  post.title = Faker::Company.bs
  post.body = Faker::Lorem.paragraph(2)
  post.author = Faker::Name.name
  post.published = [true, false].sample
  post.save!

  2.times do
    post.comments.create! author: Faker::Name.name, content: Faker::Lorem.paragraph(1)
  end
end
