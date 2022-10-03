class UnsuccessfulResult
  attr_reader :transaction
  def initialize(hash = {})
    @transaction = Transaction.new(hash)
  end

  def errors
    "Transaction Error"
  end

  def success?
    false
  end
end
