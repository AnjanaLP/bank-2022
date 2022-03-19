require 'printer'

describe Printer do
  subject(:printer)     { described_class.new(account) }
  let(:account)         { double :account, transactions: transactions }
  let(:transactions)    { [transaction_1, transaction_2, transaction_3] }
  let(:transaction_1)   { double :transaction, amount: 1000.00, type: :credit, date: "10/01/2023" }
  let(:transaction_2)   { double :transaction, amount: 2000.00, type: :credit, date: "13/01/2023" }
  let(:transaction_3)   { double :transaction, amount: 500.00,  type: :debit,  date: "14/01/2023" }

  describe '#print_statement' do
    it 'prints the statement in a nice format' do
      statement = "date || credit || debit || balance\n14/01/2023 || || 500.00 || 2500.00\n13/01/2023 || 2000.00 || || 3000.00\n10/01/2023 || 1000.00 || || 1000.00"
      expect(printer.print_statement).to eq statement
    end
  end
end
