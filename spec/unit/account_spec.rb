require 'account'

describe Account do
  subject(:account)       { described_class.new(transaction_log: transaction_log) }
  let(:transaction_log)   { double :transaction_log }
  let(:amount)            { 10 }

  describe '#deposit' do
    it 'asks the transaction_log to create a credit transaction and passes it the amount' do
      expect(transaction_log).to receive(:create_credit_transaction).with(amount)
      account.deposit(amount)
    end
  end

  describe '#withdraw' do
    it 'asks the transaction_log to create a debit transaction and passes it the amount' do
      expect(transaction_log).to receive(:create_debit_transaction).with(amount)
      account.withdraw(amount)
    end
  end
end
