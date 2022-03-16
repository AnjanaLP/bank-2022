describe 'User stories' do
  let(:account)           { Account.new(transaction_log: transaction_log) }
  let(:transaction_log)   { TransactionLog.new }
  let(:printer)           { Printer.new(transaction_log: transaction_log) }
  let(:amount)            { 100 }

  it 'an account has a default opening balance' do
    expect(account.balance).to eq Account::DEFAULT_BALANCE
  end

  it 'an account can have a specified opening balance' do
    account = Account.new(balance: amount)
    expect(account.balance).to eq amount
  end

  it 'a deposit increases the balance by the deposit amount' do
    expect { account.deposit(amount) }.to change { account.balance }.by(amount)
  end

  it 'a withdrawal decreases the balance by the withdrawal amount' do
    expect { account.withdraw(amount) }.to change { account.balance }.by(-amount)
  end

  it 'the transaction log initially has an empty transactions collection' do
    expect(transaction_log.transactions).to be_empty
  end

  it 'the transaction log stores a deposit in its transactions collection' do
    account.deposit(amount)
    expect(transaction_log.transactions).not_to be_empty
  end

  it 'the transaction log stores a withdrawal in its transactions collection' do
    account.withdraw(amount)
    expect(transaction_log.transactions).not_to be_empty
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
