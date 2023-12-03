class Api::V1::ClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :email_address
end
