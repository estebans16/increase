class Discount < ApplicationRecord
  belongs_to :payment
  enum discount_type: %i[iva retention commissions extra_cost gross_income]
end
