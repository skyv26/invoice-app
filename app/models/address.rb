class Address < ApplicationRecord
    self.inheritance_column = :_type_disabled

    has_one :client
    has_one :user

    validate :valid_type

    validates :street, presence: true
    validates :city, presence: true
    validates :postal_code, presence: true, length: { minimum: 5, maximum: 10 }
    validates :country, presence: true

    def valid_type
        allowed_types = ['client', 'sender']
        errors.add(:type, 'must be either "client" or "sender"') unless allowed_types.include?(type)
    end
end
