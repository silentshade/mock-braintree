class SuccessfulResult
  attr_reader :transaction
  def initialize(hash = {})
    @transaction = Transaction.new(hash)
  end

  def success?
    true
  end
end
