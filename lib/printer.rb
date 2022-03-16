class Printer

  def initialize(transaction_log:)
    @transaction_log = transaction_log
  end

  def print_statement
    header + statement
  end

  private

  attr_reader :transaction_log

  def header
    "date || credit || debit || balance\n"
  end

  def statement
    balance = 0
    transactions = transaction_log.transactions.map do |transaction|
      statement = ""
      statement << "#{transaction.date} || "
      if transaction.type == :credit
        statement << "#{'%.2f' % transaction.amount} || || "
        balance += transaction.amount
      else
        statement << "|| #{'%.2f' % transaction.amount} || "
        balance -= transaction.amount
      end
      statement << "#{'%.2f' % balance}"
    end
    transactions.reverse.join("\n")
  end
end
