FactoryBot.define do
  factory :discount do
    amount { Faker::Number.number(digits: 7) }
    discount_type { Faker::Number.between(from: 0, to: 4)}
    external_discount_id { Faker::Alphanumeric.alphanumeric(number: 32) }
  end
end
