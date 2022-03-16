require 'account'

describe Account do
  subject(:account)       { described_class.new(balance: 0, transaction_log: transaction_log) }
  let(:transaction_log)   { double :transaction_log }

  describe '#balance' do
    context 'when no value given on initialize' do
      it 'initially returns zero' do
        expect(account.balance).to eq 0
      end
    end

    context 'when a value given on initialize' do
      subject(:account)   { described_class.new(balance: 100) }
      it 'initially returns the given value' do
        expect(account.balance).to eq 100
      end
    end
  end

  describe '#deposit' do
    it 'adds the given amount to the balance' do
      allow(transaction_log).to receive(:create_credit_transaction)
      expect { account.deposit(100) }.to change { account.balance }.by(100)
    end

    it 'asks the transaction_log to create a credit transaction' do
      expect(transaction_log).to receive(:create_credit_transaction).with(100)
      account.deposit(100)
    end
  end
end
