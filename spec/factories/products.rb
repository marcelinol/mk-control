FactoryGirl.define do
  factory :product do
    name 'Generic product'
    association :consultant, factory: :consultant
    association :request,    factory: :request
    sales_price BigDecimal.new(62)
  end

  sequence :product do |n|
    name "Generic product #{n}"
    association :consultant, factory: :consultant
    association :request,    factory: :request
  end
end
