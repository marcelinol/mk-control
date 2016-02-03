FactoryGirl.define do
  factory :request do
    association :consultant, factory: :consultant
  end
end
