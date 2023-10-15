class Client < ApplicationRecord
  belongs_to :address
  has_one :invoice

  validates :name, presence: true
  validates :email_address, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
