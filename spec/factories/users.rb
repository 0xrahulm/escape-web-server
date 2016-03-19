FactoryGirl.define do
  factory :user do
    first_name "FirstName"
    last_name "LastName"
    email { FFaker::Internet.email }
    gender 0
    logged_in_using 0
  end
end
