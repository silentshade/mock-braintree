module MockBraintree
  class ClientTokenGateway
    def generate(options={})
      if options.nil?
        "abc123"
      else
        options
      end
    end
  end
end
