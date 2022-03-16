require_relative 'transaction'

class TransactionLog

  def initialize(transaction_class: Transaction)
    @transaction_class = transaction_class
    @transactions = []
  end

  def create_credit_transaction(amount:, balance:)
    create_transaction(amount: amount, balance: balance)
    add(transaction.credit)
  end

  def create_debit_transaction(amount:, balance:)
    create_transaction(amount: amount, balance: balance)
    add(transaction.debit)
  end

  def transactions
    @transactions.dup
  end

  private

  attr_reader :transaction, :transaction_class

  def create_transaction(amount:, balance:)
    @transaction = transaction_class.new(amount: amount, balance: balance)
  end

  def add(transaction)
    @transactions << transaction
  end
end
