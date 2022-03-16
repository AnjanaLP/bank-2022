describe 'User stories' do
  let(:account)           { Account.new(transaction_log: transaction_log) }
  let(:transaction_log)   { TransactionLog.new }
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
end
