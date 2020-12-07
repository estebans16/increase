FactoryBot.define do
  factory :payment do
    currency { Faker::Currency.code }
    total_amount { Faker::Number.number(digits: 9) }
    total_discount { Faker::Number.number(digits: 7) }
    total_with_discounts { total_amount - total_discount }
    payment_date {Faker::Date.between(from: 10.days.ago, to: 20.days.from_now) }
    external_payment_id { Faker::Alphanumeric.alphanumeric(number: 32) }
    factory :paymnet_with_transactions do
      after(:create) do |payment|
        create_list(:transaction, 3, payment: payment, approved: true, amount: payment.total_amount/3)
        create_list(:discount, 3, payment: payment, amount: payment.total_discount/3)
        payment.reload
      end
    end
  end
end
