class Client < ApplicationRecord
  validates :email, :first_name, :last_name, :job, :country,
            :address, :zip_code, :phone, :external_client_id, presence: true
  has_many :payments

  PARAMS = [
    :email,
    :first_name,
    :last_name,
    :job,
    :country,
    :address,
    :zip_code,
    :phone,
    :external_client_id
  ].freeze
end
