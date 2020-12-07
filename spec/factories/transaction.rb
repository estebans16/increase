FactoryBot.define do
  factory :transaction do
    amount { Faker::Number.number(digits: 7) }
    approved { Faker::Boolean.boolean }
    external_transaction_id { Faker::Alphanumeric.alphanumeric(number: 32) }
  end
end
