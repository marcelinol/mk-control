FactoryGirl.define do
  factory :user do
    email                 'dev@example.org'
    password              '123qwe'
    password_confirmation '123qwe'
  end
end
