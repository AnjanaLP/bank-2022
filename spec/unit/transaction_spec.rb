require 'transaction'

describe Transaction do
  subject(:transaction)   { described_class.new(100) }

  describe '#credit_transaction' do
    it 'sets the transaction type to credit' do
      transaction.credit
      expect(transaction.type).to eq :credit
    end

    it 'returns itself' do
      expect(transaction.credit).to eq transaction
    end
  end
end
