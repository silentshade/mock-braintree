module MockBraintree
  class PaymentMethodGateway
    EXCLUDED_ATTRS = %i[payment_method_nonce].freeze

    def create(attributes)
      Braintree::Util.verify_keys(Braintree::PaymentMethodGateway._create_signature, attributes)
      SuccessfulResult.new(payment_method: MockBraintree::CreditCard.new(payment_method_attributes(attributes)))
    end

    private


    def payment_method_attributes(attributes)
      MockBraintree::CC_AVAILABLE_ATTRS.each_with_object({}) do |attr, res|
        res[attr] = MockBraintree::CC_DATA[attr.to_s.to_param]
      end.merge(attributes.except(*EXCLUDED_ATTRS))
    end

  end
end
