class Item < ApplicationRecord
  belongs_to :invoice

  validates :name, presence: true
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :price_per_unit, presence: true, numericality: { greater_than_or_equal_to: 0, float: true }
end
