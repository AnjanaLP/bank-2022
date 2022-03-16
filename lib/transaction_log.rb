require_relative 'transaction'

class TransactionLog

  def initialize(transaction_class: Transaction)
    @transaction_class = transaction_class
    @transactions = []
  end

  def credit_transaction(amount)
    create_transaction(amount)
    add(transaction.credit)
  end

  def debit_transaction(amount)
    create_transaction(amount)
    add(transaction.debit)
  end

  def transactions
    @transactions.dup
  end

  private

  attr_reader :transaction, :transaction_class

  def create_transaction(amount)
    @transaction = transaction_class.new(amount)
  end

  def add(transaction)
    @transactions << transaction
  end
end
