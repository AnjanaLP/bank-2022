describe 'User stories' do
  it 'an account has a default opening balance of zero' do
    account = Account.new
    expect(account.balance).to eq 0
  end

  it 'an account can have a specified opening balance' do
    account = Account.new(100)
    expect(account.balance).to eq 100
  end
end
