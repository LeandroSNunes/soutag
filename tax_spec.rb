require 'rspec'
require_relative 'tax'

RSpec.describe Tax do
  describe '.find' do
    it 'returns the tax percentage from state' do
      expect(described_class.find('MG')).to eq(10)
    end

    context 'when the state does not exist' do
      it 'returns zero' do
        expect(described_class.find('SP')).to eq(0)
      end
    end
  end
end
