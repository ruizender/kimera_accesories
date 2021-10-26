class Payment < ApplicationRecord
  belongs_to :order
  belongs_to :payment_method
end
