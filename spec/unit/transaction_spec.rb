require 'transaction'

describe Transaction do
  subject(:transaction)   { described_class.new(amount: 10, balance: 100) }

  describe '#amount' do
    it 'returns the amount of the transaction' do
      expect(transaction.amount).to eq 10
    end
  end

  describe '#balance' do
    it 'returns the balance after the transaction' do
      expect(transaction.balance).to eq 100
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

  describe '#date' do
    it 'returns the date it was created on' do
      allow(Time).to receive(:now).and_return(Time.parse("10/01/2022"))
      expect(transaction.date).to eq "10/01/2022"
    end
  end
end
