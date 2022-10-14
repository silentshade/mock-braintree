module MockBraintree
  class CreditCardGateway

    def find(_token)
      attrs =  MockBraintree::CC_AVAILABLE_ATTRS.each_with_object({}) do |attr, res|
        res[attr] = MockBraintree::CC_DATA[attr.to_s.dasherize]
      end
      MockBraintree::CreditCard.new(attrs)
    end

  end
end
