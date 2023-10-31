require 'rails_helper'

RSpec.describe Client, type: :model do
  let(:address) do
    Address.create(
      type: 'client',
      street: '106 Kendell Street',
      city: 'Sharrington',
      postal_code: 'NR24 5WQ',
      country: 'United Kingdom'
    )
  end

  subject { described_class.new(name: 'Jensen Huang', email_address: 'jensenh@mail.com', address:) }

  context 'table test cases checking for either bad argument or invalid information.' do
    describe Client do
      [nil, true, false, 1234, 0.16, 'ok'].each do |value|
        it 'require name to be a non-empty string' do
          subject.name = value
          expect(subject).not_to be_valid, "Expected '#{value}' to be invalid for name of the Client"
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
          address.type = value
          expect(address).to_not be_valid, "Expected '#{value}' to be invalid for address type"
        end
      end

      it 'require street to be a non-empty string' do
        [nil, 1234, true, false, 0.125, 'ok'].each do |value|
          address.street = value
          expect(address).to_not be_valid, "Expected '#{value}' to be invalid address street"
        end
      end

      it 'require city to be a non-empty string' do
        [nil, 1234, true, false, 0.125, 'ok'].each do |value|
          address.city = value
          expect(address).to_not be_valid, "Expected '#{value}' to be invalid for address city"
        end
      end

      it 'require country to be a non-empty string' do
        [nil, 1234, true, false, 0.125, 'ok'].each do |value|
          address.country = value
          expect(address).to_not be_valid, "Expected '#{value}' to be invalid for address country"
        end
      end

      it 'require postal_code to be a non-empty string greater than 4 characters' do
        [nil, 1234, true, false, 0.125, 'test', 'ok'].each do |value|
          address.postal_code = value
          expect(address).to_not be_valid, "Expected '#{value}' to be invalid for address postal_code"
        end
      end
    end
  end
end
