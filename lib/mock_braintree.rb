require "mock_braintree/version"
require "mock_braintree/transaction_request"
require "mock_braintree/transaction"

module MockBraintree
  class Gateway
    def transaction
      TransactionRequest.new
    end
  end
end
