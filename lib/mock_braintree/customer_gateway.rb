module MockBraintree
  class CustomerGateway

    def create(attributes)
      Braintree::Util.verify_keys(Braintree::CustomerGateway._create_signature, attributes)
      SuccessfulResult.new(customer: Customer.new(customer_attributes(attributes)))
    end

    private

    def customer_attributes(attributes)
      { id: id, merchant_id: merchant_id }.merge(attributes)
    end

    def id
      SecureRandom.hex(3)
    end

    def merchant_id
      SecureRandom.hex(5)
    end
  end
end
