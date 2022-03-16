class Transaction

  attr_reader :amount, :type, :date

  def initialize(amount)
    @amount = amount
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
