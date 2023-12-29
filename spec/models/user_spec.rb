require 'rails_helper'

RSpec.describe User, type: :model do
  let(:sender_address) do
    Address.create(
      type: 'sender',
      street: '19 Union Terrace',
      city: 'Sharrington',
      postal_code: 'E1 3EZ',
      country: 'United Kingdom'
    )
  end

  subject do
    described_class.new(first_name: 'Jensen', last_name: 'Huang', date_of_birth: '01-01-1985',
                        email_address: 'jensenh@mail.com', address: sender_address)
  end

  context 'table test cases checking for either bad argument or invalid information.' do
    describe User do
      [nil, true, false, 1234, 0.16, 'ok'].each do |value|
        it 'require first_name to be a non-empty string' do
          subject.first_name = value
          expect(subject).not_to be_valid, "Expected '#{value}' to be invalid for first_name of the Sender"
        end

        it 'require last_name to be a non-empty string' do
          subject.last_name = value
          expect(subject).not_to be_valid, "Expected '#{value}' to be invalid for last_name of the Sender"
        end
      end

      [nil, true, false, 1234, 0.16, 'ok', 'this is the invalid_email address'].each do |value|
        it 'require email_address to be a non-empty string and in "abc@xyz.com" format' do
          subject.email_address = value
          expect(subject).not_to be_valid, "Expected '#{value}' to be invalid for email address"
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
  end
end
