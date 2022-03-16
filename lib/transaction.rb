class Transaction

  attr_reader :type, :amount

  def initialize(amount)
    @amount = amount
  end

  def credit
    @type = :credit
    self
  end

  def debit
    @type = :debit
    self
  end
end
