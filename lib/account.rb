require_relative 'transaction_log'

class Account
  DEFAULT_BALANCE = 0

  attr_reader :balance

  def initialize(balance: DEFAULT_BALANCE, transaction_log: TransactionLog.new)
    @balance = balance
    @transaction_log = transaction_log
  end

  def deposit(amount)
    @balance += amount
    transaction_log.create_credit_transaction(amount: amount, balance: balance)
  end

  def withdraw(amount)
    @balance -= amount
    transaction_log.create_debit_transaction(amount: amount, balance: balance)
  end

  private

  attr_reader :transaction_log
end
