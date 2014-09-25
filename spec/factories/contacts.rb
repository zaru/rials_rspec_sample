FactoryGirl.define do
  factory :contact do
    name "zaru"
    sequence(:email) { |n| "zaru#{n}@example.com" }
  end
end
