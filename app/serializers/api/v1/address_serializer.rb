class Api::V1::AddressSerializer < ActiveModel::Serializer
  attributes :id, :type, :street, :city, :postal_code, :country
end
