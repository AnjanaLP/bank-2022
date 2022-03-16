class Printer
  HEADER = "date || credit || debit || balance\n"

  def initialize(transaction_log:)
    @transaction_log = transaction_log
  end

  def print_statement
    HEADER + formatted_statement
  end

  def formatted_statement
    statement.reverse.join("\n")
  end

  private

  attr_reader :transaction_log

  def statement
    balance = 0
    transaction_log.transactions.map do |transaction|
      statement = ""
      statement << "#{transaction.date} || "
      if transaction.type == :credit
        statement << "#{'%.2f' % transaction.amount} || || " && balance += transaction.amount
      else
        statement << "|| #{'%.2f' % transaction.amount} || " && balance -= transaction.amount
      end
      statement << "#{'%.2f' % balance}"
    end
  end
end
