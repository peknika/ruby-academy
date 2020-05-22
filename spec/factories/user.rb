# spec/factories/articles.rb
FactoryBot.define do
  factory :user do
    first_name { "John" }
    last_name { "Doe" }
    username { "johndoe" }
    email { "johnny@test.com" }
    password { "SomeRandSecur!@pa12" }
  end
end