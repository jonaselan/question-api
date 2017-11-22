FactoryGirl.define do
  factory :tenant do
    name { Faker::HarryPotter.character }
    api_token "MyString"
  end
end
