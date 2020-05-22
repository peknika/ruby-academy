FactoryBot.define do
  factory :post do
    image { Rack::Test::UploadedFile.new(Rails.root.join('app', 'assets', 'images', 'test_image.png'), 'image/png') }
    user
    trait(:with_description) do
      image { Rack::Test::UploadedFile.new(Rails.root.join('app', 'assets', 'images', 'test_image.png'), 'image/png') }
      description { Faker::Hipster.sentence }
    end

    trait(:with_invalid_image) do

    end
  end
end