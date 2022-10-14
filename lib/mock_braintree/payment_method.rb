module MockBraintree
  class PaymentMethod
    MockBraintree::CC_AVAILABLE_ATTRS.each do |attr|
      attr_reader attr
    end

    def initialize(attributes = {})
      @attrs = attributes.keys
      attributes.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
    end
  end
end
