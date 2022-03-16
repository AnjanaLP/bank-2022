class Printer
  HEADER = "date || credit || debit || balance\n"

  def initialize(transaction_log:)
    @transaction_log = transaction_log
  end

  def print_statement
    statement = ""
    statement << HEADER
    transaction_log.transactions.reverse.each do |transaction|
      statement << "#{transaction.date} || "
      if transaction.type == :credit
        statement << "#{'%.2f' % transaction.amount} || || "
      else
        statement << "|| #{'%.2f' % transaction.amount} || "
      end
      statement << "#{'%.2f' % transaction.balance}"
      statement << "\n" unless transaction_log.transactions.first == transaction
    end
    statement
  end

  private

  attr_reader :transaction_log
end
