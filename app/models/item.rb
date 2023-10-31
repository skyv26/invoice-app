class Item < ApplicationRecord
  belongs_to :invoice

  validate :name_must_be_string
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :price_per_unit, presence: true, numericality: { greater_than_or_equal_to: 0, float: true }

  def name_must_be_string
    name_before = name_before_type_cast

    errors.add(:name, 'must be a string') unless name_before.is_a?(String)

    return unless name_before.is_a?(String)

    return unless name_before.size <= 2

    errors.add(:name, 'should be valid and greater than 2 characters')
  end
end
