FactoryBot.define do
  factory :comment do
    post
    user
    content { Faker::Hipster.sentence }
  end
end