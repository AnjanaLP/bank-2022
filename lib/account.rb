require_relative 'transaction'

class Account

  def initialize(transaction_class: Transaction)
    @transaction_class = transaction_class
    @transactions = []
  end

  def deposit(amount)
    store(new_transaction(amount))
    transaction.credit
  end

  def withdraw(amount)
    store(new_transaction(amount))
    transaction.debit
  end

  def transactions
    @transactions.dup
  end

  private

  attr_reader :transaction, :transaction_class

  def new_transaction(amount)
    @transaction = transaction_class.new(amount)
  end

  def store(transaction)
    @transactions << transaction
  end
end
