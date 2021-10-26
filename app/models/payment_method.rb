class PaymentMethod < ApplicationRecord
  has_many :payments
end
