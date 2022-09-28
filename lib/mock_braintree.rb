require "mock_braintree/version"
require "mock_braintree/transaction_request"
require "mock_braintree/transaction"
require "mock_braintree/successful_result"
require "mock_braintree/unsuccessful_result"
require "mock_braintree/client_token_gateway"

module MockBraintree
  class Gateway
    def transaction
      TransactionRequest.new
    end
    def client_token
      ClientTokenGateway.new
    end
  end
end
