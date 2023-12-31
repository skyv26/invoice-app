class Api::V1::ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :quantity, :price_per_unit
  belongs_to :invoice, serializer: Api::V1::InvoiceSerializer
end
