FactoryBot.define do
  factory :product_price do
    value { "9.99" }
    currency { "MyString" }
    product_id { 1 }
  end
end
