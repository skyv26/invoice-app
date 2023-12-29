require 'rails_helper'

RSpec.describe Address, type: :model do
  subject do
    described_class.new(type: 'client', street: '106 Kendell Street', city: 'Sharrington', postal_code: 'NR24 5WQ',
                        country: 'United Kingdom')
  end
  context 'test cases for either
          bad or invalid arguments.' do
    describe Address do
      it 'type should a non-empty and must be a string either "sender" or "client"' do
        [nil, 1234, true, false, 0.125, 'test'].each do |value|
          subject.type = value
          expect(subject).to_not be_valid
        end
      end

      it 'street should a non-empty and must be a string' do
        [nil, 1234, true, false, 0.125, 'ok'].each do |value|
          subject.street = value
          expect(subject).to_not be_valid
        end
      end

      it 'city should a non-empty and must be a string' do
        [nil, 1234, true, false, 0.125, 'ok'].each do |value|
          subject.city = value
          expect(subject).to_not be_valid
        end
      end

      it 'country should a non-empty and must be a string' do
        [nil, 1234, true, false, 0.125, 'ok'].each do |value|
          subject.country = value
          expect(subject).to_not be_valid
        end
      end

      it 'postal_code should a non-empty, string greater than 4 characters' do
        [nil, 1234, true, false, 0.125, 'test', 'ok'].each do |value|
          subject.postal_code = value
          expect(subject).to_not be_valid
        end
      end
    end
  end
end
