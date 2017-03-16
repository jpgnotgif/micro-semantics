FactoryGirl.define do
  factory :product do
    name Faker::Pokemon.name
    image_url Faker::Internet.url('example.com', '/test.jpg')
    manufacturer Faker::Company.name
    model Faker::Pokemon.location
    term 'pokemon'
  end
end
