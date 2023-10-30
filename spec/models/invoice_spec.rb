require 'rails_helper'

RSpec.describe Invoice, type: :model do
  let(:sender_address) do
    Address.create(
      type: 'sender',
      street: '19 Union Terrace',
      city: 'Sharrington',
      postal_code: 'E1 3EZ', 
      country: 'United Kingdom'
    )
  end

  let(:sender) do
    User.create(
      first_name: 'Jensen',
      last_name: 'Huang',
      date_of_birth: '01-01-1985',
      email_address: 'jensenh@mail.com', 
      address: sender_address
    )
  end

  let(:client_address) do
    Address.create(
      type: 'client',
      street: '106 Kendell Street',
      city: 'Sharrington',
      postal_code: 'NR24 5WQ', 
      country: 'United Kingdom'
    )
  end

  let(:client) do
    Client.create(
      name: 'Jensen Huang',
      email_address: 'jensenh@mail.com',
      address: client_address
    )
  end

  subject { described_class.new(description: 'Re-branding', payment_terms: 1, payment_due_date: '01-01-2025', status: 'paid', total: 1800.95, client: client, user: sender)}

  context 'table test cases checking for either bad argument or invalid information.' do
    describe Invoice do
      [nil, true, false, 1234, 0.16, 'ok'].each do |value|
        it 'require description to be a non-empty string' do
          subject.description = value
          expect(subject).not_to be_valid, "Expected '#{value}' to be invalid for description of the Invoice"
        end
      end

      [nil, true, false, 0.16, 'ok'].each do |value|
        it 'require payment_terms to be a non-empty string' do
          subject.payment_terms = value
          expect(subject).not_to be_valid, "Expected '#{value}' to be invalid for payment_terms Invoice"
        end
      end

      [nil].each do |value|
        it 'require payment_due_date to be a non-empty string' do
          subject.payment_due_date = value
          expect(subject).not_to be_valid, "Expected '#{value}' to be invalid for payment_due_date Invoice"
        end
      end

      [nil, 0.16, true, false, 'ok', 'invalid_status'].each do |value|
        it 'require status to be a non-empty string' do
          subject.status = value
          expect(subject).not_to be_valid, "Expected '#{value}' to be invalid for status Invoice"
        end
      end
    end

    describe Address do
      it 'require type to be a non-empty string with either "sender" or "client"' do
        [nil, 1234, true, false, 0.125, 'test'].each do |value|
          client_address.type = value
          expect(client_address).to_not be_valid, "Expected '#{value}' to be invalid for client_address type"
        end
      end

      it 'require street to be a non-empty string' do
        [nil, 1234, true, false, 0.125, 'ok'].each do |value|
          client_address.street = value
          expect(client_address).to_not be_valid, "Expected '#{value}' to be invalid client_address street"
        end
      end

      it 'require city to be a non-empty string' do
        [nil, 1234, true, false, 0.125, 'ok'].each do |value|
          client_address.city = value
          expect(client_address).to_not be_valid, "Expected '#{value}' to be invalid for client_address city"
        end
      end

      it 'require country to be a non-empty string' do
        [nil, 1234, true, false, 0.125, 'ok'].each do |value|
          client_address.country = value
          expect(client_address).to_not be_valid, "Expected '#{value}' to be invalid for client_address country"
        end
      end

      it 'require postal_code to be a non-empty string greater than 4 characters' do
        [nil, 1234, true, false, 0.125, 'test', 'ok'].each do |value|
          client_address.postal_code = value
          expect(client_address).to_not be_valid, "Expected '#{value}' to be invalid for client_address postal_code"
        end
      end
    end

    describe Address do
      it 'require type to be a non-empty string with either "sender" or "client"' do
        [nil, 1234, true, false, 0.125, 'test'].each do |value|
          sender_address.type = value
          expect(sender_address).to_not be_valid, "Expected '#{value}' to be invalid for sender_address type"
        end
      end

      it 'require street to be a non-empty string' do
        [nil, 1234, true, false, 0.125, 'ok'].each do |value|
          sender_address.street = value
          expect(sender_address).to_not be_valid, "Expected '#{value}' to be invalid sender_address street"
        end
      end

      it 'require city to be a non-empty string' do
        [nil, 1234, true, false, 0.125, 'ok'].each do |value|
          sender_address.city = value
          expect(sender_address).to_not be_valid, "Expected '#{value}' to be invalid for sender_address city"
        end
      end

      it 'require country to be a non-empty string' do
        [nil, 1234, true, false, 0.125, 'ok'].each do |value|
          sender_address.country = value
          expect(sender_address).to_not be_valid, "Expected '#{value}' to be invalid for sender_address country"
        end
      end

      it 'require postal_code to be a non-empty string greater than 4 characters' do
        [nil, 1234, true, false, 0.125, 'test', 'ok'].each do |value|
          sender_address.postal_code = value
          expect(sender_address).to_not be_valid, "Expected '#{value}' to be invalid for sender_address postal_code"
        end
      end
    end

    describe Client do
      [nil, true, false, 1234, 0.16, 'ok'].each do |value|
        it 'require name to be a non-empty string' do
          client.name = value
          expect(client).not_to be_valid, "Expected '#{value}' to be invalid for name of the Client"
        end
      end

      [nil, true, false, 1234, 0.16, 'ok', 'this is the invalid_email address'].each do |value|
        it 'require email_address to be a non-empty string and in "abc@xyz.com" format' do
          client.email_address = value
          expect(client).not_to be_valid, "Expected '#{value}' to be invalid for email address"
        end
      end
    end

    describe User do
      [nil, true, false, 1234, 0.16, 'ok'].each do |value|
        it 'require first_name to be a non-empty string' do
          sender.first_name = value
          expect(sender).not_to be_valid, "Expected '#{value}' to be invalid for first_name of the Sender"
        end
      end

      [nil, true, false, 1234, 0.16, 'ok'].each do |value|
        it 'require last_name to be a non-empty string' do
          sender.last_name = value
          expect(sender).not_to be_valid, "Expected '#{value}' to be invalid for last_name of the Sender"
        end
      end

      [nil, true, false, 1234, 0.16, 'ok', 'this is the invalid_email address'].each do |value|
        it 'require email_address to be a non-empty string and in "abc@xyz.com" format' do
          sender.email_address = value
          expect(sender).not_to be_valid, "Expected '#{value}' to be invalid for email address"
        end
      end
    end
  end
end
