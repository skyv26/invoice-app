class Api::V1::InvoiceSerializer < ActiveModel::Serializer
  attributes :id, :description, :payment_due_date, :payment_terms, :status, :total
end
