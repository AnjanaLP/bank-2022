require 'account'

describe Account do
  subject(:account)   { described_class.new }

  describe '#balance' do
    context 'when no value given on initialize' do
      it 'initially returns zero' do
        expect(account.balance).to eq 0
      end
    end

    context 'when a value given on initialize' do
      subject(:account)   { described_class.new(100) }
      it 'initially returns the given value' do
        expect(account.balance).to eq 100
      end
    end
  end
end
