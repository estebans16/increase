class Transaction < ApplicationRecord
  belongs_to :payment

  def disapproved
    !approved
  end
end
