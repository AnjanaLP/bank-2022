require_relative 'transaction_log'

class Account
  attr_reader :transaction_log

  def initialize(transaction_log: TransactionLog.new)
    @transaction_log = transaction_log
  end

  def deposit(amount)
    transaction_log.credit_transaction(amount)
  end

  def withdraw(amount)
    transaction_log.debit_transaction(amount)
  end
end
