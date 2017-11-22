FactoryGirl.define do
  factory :question do
    user
    body { Faker::Lorem.paragraph(2, false, 4) }

    factory :private_question do
      private true
    end
  end
end
