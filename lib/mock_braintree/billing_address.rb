module MockBraintree
  class BillingAddress < Struct.new(*MockBraintree::CC_DATA['billing-address'].keys.map(&:underscore).map(&:to_sym), keyword_init: true); end
end
