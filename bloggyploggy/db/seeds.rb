require 'faker'

5.times do

  post = Post.new
  post.title = Faker::Company.bs
  post.body = Faker::Lorem.paragraph(2)
  post.author = Faker::Name.name
  post.published = [true, false].sample
  post.save!
end
