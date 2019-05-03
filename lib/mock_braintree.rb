require "mock_braintree/version"
require "mock_braintree/transaction_request"
require "mock_braintree/transaction"
require "mock_braintree/successful_result"
require "mock_braintree/unsuccessful_result"

module MockBraintree
  class Gateway
    def transaction
      TransactionRequest.new
    end
  end
end
