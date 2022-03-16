require 'transaction_log'

describe TransactionLog do
  subject(:transaction_log)     { described_class.new(transaction_class: transaction_class) }
  let(:transaction_class)       { double :transaction_class, new: transaction }
  let(:transaction)             { double :transaction }

  describe '#transactions' do
    it 'is initially empty' do
      expect(transaction_log.transactions).to be_empty
    end

    it 'stores all the credit transactions' do
      allow(transaction).to receive(:credit).and_return transaction
      transaction_log.create_credit_transaction(100)
      expect(transaction_log.transactions).to include transaction
    end
  end

  describe '#create_credit_transaction' do
    it 'creates a new transaction and passes it the amount' do
      allow(transaction).to receive(:credit)
      expect(transaction_class).to receive(:new).with(100).and_return transaction
      transaction_log.create_credit_transaction(100)
    end

    it 'tells the newly created transaction it is a credit transaction' do
      expect(transaction).to receive(:credit)
      transaction_log.create_credit_transaction(100)
    end
  end
end
