class Client < ApplicationRecord
  belongs_to :address
  has_one :invoice

  validate :name_must_be_string
  validates :email_address, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  def name_must_be_string
    name_before = name_before_type_cast

    errors.add(:name, 'must be a string') unless name_before.is_a?(String)

    return unless name_before.is_a?(String)

    return unless name_before.size <= 2

    errors.add(:name, 'should be valid and greater than 2 characters')
  end
end
