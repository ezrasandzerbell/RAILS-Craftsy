FactoryGirl.define do
  factory :user do
    email 'test@email.com'
    password 'password'
    name 'Admin'
    admin true
    id 1
  end
end
