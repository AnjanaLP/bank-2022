require_relative 'transaction_log'

class Account

  attr_reader :balance, :transaction_log

  def initialize(balance: 0, transaction_log: TransactionLog.new)
    @balance = balance
    @transaction_log = transaction_log
  end

  def deposit(amount)
    transaction_log.create_credit_transaction(amount)
    @balance += amount
  end
end
