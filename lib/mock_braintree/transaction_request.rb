class TransactionRequest
  def sale(hash = {})
    if hash[:amount].to_f < 2000.00
      SuccessfulResult.new(hash)
    elsif (hash[:amount].to_f >= 2000) && (hash[:amount].to_i < 3000)
      UnsuccessfulResult.new(hash)
    elsif (hash[:amount].to_f >= 3000) && (hash[:amount].to_i <= 3000.99)
      UnsuccessfulResult.new(hash)
    else
      UnsuccessfulResult.new(hash)
    end
  end
end
