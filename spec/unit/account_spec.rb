require 'account'

describe Account do
  subject(:account)         { described_class.new(transaction_class: transaction_class) }
  let(:transaction_class)   { double :transaction_class, new: transaction }
  let(:transaction)         { double :transaction }
  let(:amount)              { 10 }

  describe '#transactions' do
    it 'is initially empty' do
      expect(account.transactions).to be_empty
    end
  end

  describe '#deposit' do
    before { allow(transaction).to receive(:credit) }

    it 'creates a new transaction and passes it the amount' do
      expect(transaction_class).to receive(:new).with(amount)
      account.deposit(amount)
    end

    it 'tells the created transaction it is a credit transaction' do
      expect(transaction).to receive(:credit)
      account.deposit(amount)
    end

    it 'stores the created transaction' do
      account.deposit(amount)
      expect(account.transactions).not_to be_empty
    end
  end

  describe '#withdraw' do
    before { allow(transaction).to receive(:debit) }

    it 'creates a new transaction and passes it the amount' do
      expect(transaction_class).to receive(:new).with(amount)
      account.withdraw(amount)
    end

    it 'tells the created transaction it is a debit transaction' do
      expect(transaction).to receive(:debit)
      account.withdraw(amount)
    end

    it 'stores the created transaction' do
      account.withdraw(amount)
      expect(account.transactions).not_to be_empty
    end
  end
end
