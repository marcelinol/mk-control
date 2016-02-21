FactoryGirl.define do
  factory :sale do
    association :customer, factory: :customer
  end

  factory :sale_with_product, class: Sale do
    association :customer, factory: :customer
    before(:create) do |sale|
      FactoryGirl.create(:product, sale: sale)
    end
  end
end
