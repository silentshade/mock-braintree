class UnsuccessfulResult
  attr_reader :transaction
  def initialize(hash = {})
    @transaction = Transaction.new(hash)
  end

  def errors
    "BOOM"
  end

  def success?
    false
  end
end
