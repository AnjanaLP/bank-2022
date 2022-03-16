require_relative 'transaction_log'

class Account
  
  def initialize(transaction_log: TransactionLog.new)
    @transaction_log = transaction_log
  end

  def deposit(amount)
    transaction_log.create_credit_transaction(amount)
  end

  def withdraw(amount)
    transaction_log.create_debit_transaction(amount)
  end

  private

  attr_reader :transaction_log
end
