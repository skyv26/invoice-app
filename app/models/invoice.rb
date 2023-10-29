class Invoice < ApplicationRecord
  belongs_to :client
  belongs_to :user
  has_many :items

  validate :description_must_be_string
  validates :payment_terms, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :payment_due_date, presence: true
  validate :valid_status
  validates :total, presence: true, numericality: { greater_than_or_equal_to: 0, float: true }

  def valid_status
    allowed_status = ['pending', 'paid', 'default']
    errors.add(:status, 'must be either "client" or "sender" or "default"') unless allowed_status.include?(status)
  end

  def description_must_be_string
    description_before = description_before_type_cast
    
    errors.add(:description, 'must be a string') unless description_before.is_a?(String)

    return unless description_before.is_a?(String)
    
    if description_before.size <= 10 || description_before.size >= 50 
        errors.add(:description, 'should be valid and between 10-50 characters long')
    end
  end

end
