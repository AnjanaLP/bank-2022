class Printer
  HEADER = "date || credit || debit || balance\n"

  def initialize(account)
    @account = account
  end

  def print_statement
    HEADER + formatted_statement
  end

  def formatted_statement
    statement.reverse.join("\n")
  end

  private

  attr_reader :account

  def statement
    balance = 0
    account.transactions.map do |transaction|
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
