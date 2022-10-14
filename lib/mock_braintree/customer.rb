module MockBraintree
  class Customer < Struct.new(:id, :merchant_id, :email, :first_name, :last_name, :phone, :created_at, :updated_at, keyword_init: true); end
end
