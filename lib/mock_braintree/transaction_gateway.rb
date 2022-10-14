module MockBraintree
  class TransactionGateway
    # sets time for response between 2-5 seconds (with 3 heavily weighted) to send response, adjust this to customize desired response times
    # You can also reduce this to 0 if you are looking to get instant responses when running specs
    # WAIT_TIME = [2, 3, 3, 3, 3, 4, 5].sample
    def sale(hash = {})
      #sleep(WAIT_TIME)
      if hash[:amount].to_f < 2000.00
        SuccessfulResult.new(transaction: transaction(hash))
      elsif (hash[:amount].to_f >= 2000) && (hash[:amount].to_i < 3000)
        UnsuccessfulResult.new(transaction: transaction(hash))
      elsif (hash[:amount].to_f >= 3000) && (hash[:amount].to_i <= 3000.99)
        UnsuccessfulResult.new(transaction: transaction(hash))
      else
        UnsuccessfulResult.new(transaction: hash)
      end
    end

    def transaction(attrs)
      Transaction.new(attrs)
    end

    def refund(id, amount = '10.00', order_id = nil)
      # sleep(WAIT_TIME)
      hash_args = {
        id: id,
        amount: amount,
        order_id: order_id,
        options: {
          submit_for_settlement: true
        }
      }
      SuccessfulResult.new(transaction: transaction(hash_args))
    end

    def void(id)
      hash_args = {
        id: id,
        void: true
      }
      SuccessfulResult.new(transaction: transaction(hash_args))
    end
  end
end
