describe 'User stories' do
  let(:account)           { Account.new }
  let(:printer)           { Printer.new(account) }
  let(:amount)            { 100 }

  it 'the account initially has an empty transactions collection' do
    expect(account.transactions).to be_empty
  end

  it 'the account stores a deposit in its transactions collection' do
    account.deposit(amount)
    expect(account.transactions).not_to be_empty
  end

  it 'the account stores a withdrawal in its transactions collection' do
    account.withdraw(amount)
    expect(account.transactions).not_to be_empty
  end

  it 'a statement can be printed' do
    allow(Time).to receive(:now).and_return(Time.parse("10/01/2023"))
    account.deposit(1000)
    allow(Time).to receive(:now).and_return(Time.parse("13/01/2023"))
    account.deposit(2000)
    allow(Time).to receive(:now).and_return(Time.parse("14/01/2023"))
    account.withdraw(500)
    statement = "date || credit || debit || balance\n14/01/2023 || || 500.00 || 2500.00\n13/01/2023 || 2000.00 || || 3000.00\n10/01/2023 || 1000.00 || || 1000.00"
    expect(printer.print_statement).to eq statement
  end
end
