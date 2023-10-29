class User < ApplicationRecord
  belongs_to :address

  validate :first_name_must_be_string
  validate :last_name_must_be_string
  validates :email_address, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :date_of_birth, presence: true

  def first_name_must_be_string
    first_name_before = first_name_before_type_cast
    
    errors.add(:first_name, 'must be a string') unless first_name_before.is_a?(String)

    return unless first_name_before.is_a?(String)
    
    if first_name_before.size <= 2
        errors.add(:first_name, 'should be valid and greater than 2 characters')
    end
  end

  def last_name_must_be_string
    last_name_before = last_name_before_type_cast
    
    errors.add(:last_name, 'must be a string') unless last_name_before.is_a?(String)

    return unless last_name_before.is_a?(String)
    
    if last_name_before.size <= 2
        errors.add(:last_name, 'should be valid and greater than 2 characters')
    end
  end
end
