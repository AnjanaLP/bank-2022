require 'transaction_log'

describe TransactionLog do
  subject(:transaction_log)     { described_class.new(transaction_class: transaction_class) }
  let(:transaction_class)       { double :transaction_class, new: transaction }
  let(:transaction)             { double :transaction }

  describe '#transactions' do
    it 'is initially empty' do
      expect(transaction_log.transactions).to be_empty
    end

    it 'stores credit transactions' do
      allow(transaction).to receive(:credit).and_return transaction
      transaction_log.create_credit_transaction(amount: 10, balance: 100)
      expect(transaction_log.transactions).to include transaction
    end

    it 'stores debit transactions' do
      allow(transaction).to receive(:debit).and_return transaction
      transaction_log.create_debit_transaction(amount: 10, balance: 100)
      expect(transaction_log.transactions).to include transaction
    end
  end

  describe '#create_credit_transaction' do
    it 'creates a new transaction and passes it the amount' do
      allow(transaction).to receive(:credit)
      expect(transaction_class).to receive(:new).with(amount: 10, balance: 100).and_return transaction
      transaction_log.create_credit_transaction(amount: 10, balance: 100)
    end

    it 'tells the newly created transaction it is a credit transaction' do
      expect(transaction).to receive(:credit)
      transaction_log.create_credit_transaction(amount: 10, balance: 100)
    end
  end

  describe '#create_debit_transaction' do
    it 'creates a new transaction and passes it the amount' do
      allow(transaction).to receive(:debit)
      expect(transaction_class).to receive(:new).with(amount: 10, balance: 100).and_return transaction
      transaction_log.create_debit_transaction(amount: 10, balance: 100)
    end

    it 'tells the newly created transaction it is a debit transaction' do
      expect(transaction).to receive(:debit)
      transaction_log.create_debit_transaction(amount: 10, balance: 100)
    end
  end
end
