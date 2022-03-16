require 'account'

describe Account do
  subject(:account)       { described_class.new(transaction_log: transaction_log) }
  let(:transaction_log)   { double :transaction_log }
  let(:amount)            { 10 }

  describe '#balance' do
    context 'when no value given on initialize' do
      it 'has the default opening balance' do
        expect(account.balance).to eq described_class::DEFAULT_BALANCE
      end
    end

    context 'when a value given on initialize' do
      subject(:account)   { described_class.new(balance: amount) }
      it 'has the specified opening balance' do
        expect(account.balance).to eq amount
      end
    end
  end

  describe '#deposit' do
    it 'adds the given amount to the balance' do
      allow(transaction_log).to receive(:create_credit_transaction)
      expect { account.deposit(amount) }.to change { account.balance }.by(amount)
    end

    it 'asks the transaction_log to create a credit transaction and passes it the amount and current balance' do
      expect(transaction_log).to receive(:create_credit_transaction).with(amount: amount, balance: amount)
      account.deposit(amount)
    end
  end

  describe '#withdraw' do
    it 'subtracts the given amount from the balance' do
      allow(transaction_log).to receive(:create_debit_transaction)
      expect { account.withdraw(amount) }.to change { account.balance }.by(-amount)
    end

    it 'asks the transaction_log to create a debit transaction and passes it the amount and current balance' do
      expect(transaction_log).to receive(:create_debit_transaction).with(amount: amount, balance: -amount)
      account.withdraw(amount)
    end
  end
end
