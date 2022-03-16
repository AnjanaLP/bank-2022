require 'transaction'

describe Transaction do
  subject(:transaction)   { described_class.new(100) }

  describe '#amount' do
    it 'returns the amount of the transaction' do
      expect(transaction.amount).to eq 100
    end
  end

  describe '#credit' do
    it 'sets the transaction type to credit' do
      transaction.credit
      expect(transaction.type).to eq :credit
    end

    it 'returns itself' do
      expect(transaction.credit).to eq transaction
    end
  end

  describe '#debit' do
    it 'sets the transaction type to debit' do
      transaction.debit
      expect(transaction.type).to eq :debit
    end

    it 'returns itself' do
      expect(transaction.debit).to eq transaction
    end
  end
end
