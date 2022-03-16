class Transaction

  attr_reader :type

  def initialize(amount)
    @amount = amount
  end

  def credit
    @type = :credit
    self
  end
end
