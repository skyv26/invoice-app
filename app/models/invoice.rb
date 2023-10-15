class Invoice < ApplicationRecord
  belongs_to :client
  belongs_to :user
  has_many :items

  validates :description, presence: true
  validates :payment_terms, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :payment_due_date, presence: true
  validate :valid_status
  validates :total, presence: true, numericality: { greater_than_or_equal_to: 0, float: true }

  def valid_status
    allowed_status = ['pending', 'paid', 'default']
    errors.add(:status, 'must be either "client" or "sender" or "default"') unless allowed_status.include?(status)
  end

end
