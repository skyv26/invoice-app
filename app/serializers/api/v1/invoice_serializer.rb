class Api::V1::InvoiceSerializer < ActiveModel::Serializer
  attributes :id, :description, :payment_due_date, :payment_terms, :status, :total
  belongs_to :client, serializer: Api::V1::ClientSerializer
  has_many :items, serializer: Api::V1::ItemSerializer
end
