require "mock_braintree/version"
require 'mock_braintree/util'
require "mock_braintree/transaction_gateway"
require "mock_braintree/transaction"
require "mock_braintree/successful_result"
require "mock_braintree/unsuccessful_result"
require "mock_braintree/client_token_gateway"
require "mock_braintree/customer_gateway"
require "mock_braintree/customer"
require "mock_braintree/credit_card_gateway"
require "mock_braintree/credit_card"
require "mock_braintree/payment_method_gateway"
require "mock_braintree/payment_method"
require "mock_braintree/billing_address"

module MockBraintree
  class Gateway
    def transaction
      MockBraintree::TransactionGateway.new
    end

    def client_token
      MockBraintree::ClientTokenGateway.new
    end

    def customer
      MockBraintree::CustomerGateway.new
    end

    def payment_method
      MockBraintree::PaymentMethodGateway.new
    end

    def credit_card
      MockBraintree::CreditCardGateway.new
    end
  end
end



