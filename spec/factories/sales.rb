FactoryGirl.define do
  factory :sale do
    association :customer, factory: :customer
  end
end
