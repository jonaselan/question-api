FactoryGirl.define do
  factory :answer do
    question
    user
    body { Faker::Lorem.paragraph(2, false, 4) }
  end
end
