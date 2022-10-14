module MockBraintree
  class SuccessfulResult

    attr_reader :address
    attr_reader :apple_pay_options
    attr_reader :credentials
    attr_reader :credit_card
    attr_reader :customer
    attr_reader :disputes
    attr_reader :document_upload
    attr_reader :evidence
    attr_reader :merchant
    attr_reader :merchant_account
    attr_reader :merchant_accounts
    attr_reader :payment_method
    attr_reader :payment_method_nonce
    attr_reader :paypal_account
    attr_reader :plan
    attr_reader :settlement_batch_summary
    attr_reader :subscription
    attr_reader :supported_networks
    attr_reader :transaction
    attr_reader :us_bank_account_verification
    attr_reader :credit_card_verification

    def initialize(attributes = {})
      @attrs = attributes.keys
      attributes.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
    end

    def success?
      true
    end
  end
end
