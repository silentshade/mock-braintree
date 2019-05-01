class TransactionRequest
  def sale(hash = {})
    Transaction.new(hash)
  end
end
