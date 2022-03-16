class Transaction

  attr_reader :amount, :balance, :date, :type

  def initialize(amount:, balance:)
    @amount = amount
    @balance = balance
    @date = today
  end

  def credit
    @type = :credit
    self
  end

  def debit
    @type = :debit
    self
  end

  private

  def today
    Time.now.strftime("%d/%m/%Y")
  end
end
