FactoryBot.define do
  factory :client do
    email { Faker::Alphanumeric.alphanumeric(number: 30) }
    first_name { Faker::Name.name }
    last_name { Faker::Name.last_name }
    job { Faker::Job.title }
    country { Faker::Nation.nationality }
    zip_code { Faker::Number.number(digits: 5) }
    address { Faker::Address.full_address }
    phone { Faker::PhoneNumber.phone_number }
    external_client_id { Faker::Alphanumeric.alphanumeric(number: 32) }
    factory :client_with_payments do
      after(:create) do |client|
        create_list(:paymnet_with_transactions, 5, client: client)

        # You may need to reload the record here, depending on your application
        client.reload
      end
    end
  end
end
