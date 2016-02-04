FactoryGirl.define do
  factory :product do
    name 'Generic product'
    association :consultant, factory: :consultant
    association :request,    factory: :request
  end

  sequence :product do |n|
    name "Generic product #{n}"
    association :consultant, factory: :consultant
    association :request,    factory: :request
  end
end
