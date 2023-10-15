class User < ApplicationRecord
  belongs_to :address

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email_address, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :date_of_birth, presence: true
end
