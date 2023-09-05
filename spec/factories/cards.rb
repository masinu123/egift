FactoryBot.define do
  factory :card do
    product_id { 1 }
    user_id { 1 }
    state { 1 }
    expires_at { "2023-09-05 21:20:36" }
    activation_code { "MyString" }
    pin_code { "MyString" }
  end
end
