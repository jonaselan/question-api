FactoryGirl.define do
  factory :user do
    name { Faker::DragonBall.character }
  end
end
