# spec/factories/articles.rb
FactoryBot.define do
  factory :user, aliases: [:follower, :followed] do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name}
    username { Faker::Internet.username }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end