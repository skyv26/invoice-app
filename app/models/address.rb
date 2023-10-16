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
        street_before = street_before_type_cast
        
        errors.add(:street, 'must be a string') unless street_before.is_a?(String)

        return unless street_before.is_a?(String)
        
        if street_before.size <= 2
            errors.add(:street, 'should be valid and greater than 2 characters')
        end
    end

    def city_must_be_string
        city_before = city_before_type_cast
        
        errors.add(:city, 'must be a string') unless city_before.is_a?(String)

        return unless city_before.is_a?(String)
        
        if city_before.size <= 2
            errors.add(:city, 'should be valid and greater than 2 characters')
        end
    end

    def postal_code_must_be_string
        postal_code_before = postal_code_before_type_cast
        
        errors.add(:postal_code, 'must be a string') unless postal_code_before.is_a?(String)

        return unless postal_code_before.is_a?(String)
        
        if postal_code_before.size <= 4
            errors.add(:postal_code, 'should be valid and greater than 4 characters')
        end
    end

    def country_must_be_string
        country_before = country_before_type_cast
        
        errors.add(:country, 'must be a string') unless country_before.is_a?(String)

        return unless country_before.is_a?(String)
        
        if country_before.size <= 2
            errors.add(:country, 'should be valid and greater than 2 characters')
        end
    end
end
