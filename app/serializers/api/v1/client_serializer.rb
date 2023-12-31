class Api::V1::ClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :email_address
  belongs_to :address, serializer: Api::V1::AddressSerializer
end
