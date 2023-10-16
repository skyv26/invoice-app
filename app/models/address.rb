class Address < ApplicationRecord
    self.inheritance_column = :_type_disabled

    has_one :client
    has_one :user

    validate :valid_type

    validate :street_must_be_string
    validate :city_must_be_string
    validate :postal_code_must_be_string
    validate :country_must_be_string

    def valid_type
        allowed_types = ['client', 'sender']
        errors.add(:type, 'must be either "client" or "sender"') unless allowed_types.include?(type)
    end

    def street_must_be_string
        errors.add(:street, 'must be a string') unless street_before_type_cast.is_a?(String)
    end

    def city_must_be_string
        errors.add(:city, 'must be a string') unless city_before_type_cast.is_a?(String)
    end

    def postal_code_must_be_string
        errors.add(:postal_code, 'must be a string and between 5-10 digits') unless postal_code_before_type_cast.is_a?(String)
    end

    def country_code_must_be_string
        errors.add(:country, 'must be a string') unless country_code_before_type_cast.is_a?(String)
    end
end
