require 'rspec'
require 'timecop'
require_relative 'discount'

RSpec.describe Discount do
  describe 'constants' do
    it { expect(described_class::CATEGORIES).to include('food', 'beverages') }
    it { expect(described_class::CATEGORY_DISCOUNT).to eq(0.05) }
    it { expect(described_class::BIRTHDAY_DISCOUNT).to eq(0.1) }
  end

  describe '.by_category' do
    it 'returns the discount by category' do
      expect(described_class.by_category('food')).to eq(0.05)
    end

    context 'when the category does not exist' do
      it 'returns zero' do
        expect(described_class.by_category('gifts')).to eq(0)
      end
    end
  end

  describe '.by_birthday' do
    it 'returns the discount by birthday month' do
      Timecop.freeze(Time.local(2024, 03, 15, 12, 0, 0)) do
        expect(described_class.by_birthday(3)).to eq(0.1)
      end
    end

    context 'when it is not the birthday month' do
      it 'returns zero' do
        Timecop.freeze(Time.local(2024, 03, 15, 12, 0, 0)) do
          expect(described_class.by_birthday(5)).to eq(0)
        end
      end
    end
  end
end
