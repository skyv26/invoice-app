class Api::V1::UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email_address, :contact, :date_of_birth, :profile_picture
end
