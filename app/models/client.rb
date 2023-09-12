class Client < ApplicationRecord
  belongs_to :address
  has_one :invoice
end
