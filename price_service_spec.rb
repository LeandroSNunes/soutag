require 'rspec'
require 'timecop'
require_relative 'tax'
require_relative 'discount'
require_relative 'product'
require_relative 'user'
require_relative 'price_service'

RSpec.describe PriceService do
  before { Timecop.freeze(Time.local(2024, 06, 15, 12, 0, 0)) }
  after { Timecop.return }

  let(:product) { instance_double('Product', id: 1, value: 100, category: 'gifts') }
  let(:user) { instance_double('User', id: 1, birthday_month: 5, state: 'SP') }


  describe '.call' do
    it 'calculates the price' do
      allow(product).to receive(:category).and_return('food')
      allow(user).to receive(:state).and_return('MG')

      Timecop.freeze(Time.local(2024, 05, 15, 12, 0, 0)) do
        expect(described_class.call(product, user)).to eq(94.05)
      end
    end

    it 'calculates the price without tax and discounts' do
      expect(described_class.call(product, user)).to eq(100.0)
    end

    context 'when there is only tax' do
      it 'calculates the price correctly' do
        allow(user).to receive(:state).and_return('MG')
        expect(described_class.call(product, user)).to eq(110.0)
      end
    end

    context 'when there is only a discount per category' do
      it 'calculates the price correctly' do
      allow(product).to receive(:category).and_return('beverages')
        expect(described_class.call(product, user)).to eq(95.0)
      end
    end

    context 'when there is only a birthday discount' do
      it 'calculates the price correctly' do
        Timecop.freeze(Time.local(2024, 05, 15, 12, 0, 0)) do
          expect(described_class.call(product, user)).to eq(90.0)
        end
      end
    end
  end
end
