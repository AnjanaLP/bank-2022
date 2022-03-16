describe 'User stories' do
  let(:account)           { Account.new }

  it 'an account has a default opening balance of zero' do
    expect(account.balance).to eq 0
  end

  it 'an account can have a specified opening balance' do
    account = Account.new(balance: 100)
    expect(account.balance).to eq 100
  end

  it 'a deposit increases the balance by the deposit amount' do
    expect { account.deposit(100) }.to change { account.balance }.by(100)
  end

  it 'a deposit is stored in the transaction log' do
    transaction_log = account.transaction_log
    account.deposit(100)
    expect(transaction_log.transactions).not_to be_empty
  end
end
