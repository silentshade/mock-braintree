module MockBraintree
  CC_AVAILABLE_ATTRS = %i[billing_address
                         bin
                         card_type
                         cardholder_name
                         commercial
                         country_of_issuance
                         created_at
                         customer_id
                         customer_global_id
                         customer_location
                         debit
                         default
                         durbin_regulated
                         expiration_month
                         expiration_year
                         expired
                         global_id
                         healthcare
                         image_url
                         issuing_bank
                         last_4
                         payroll
                         prepaid
                         product_id
                         subscriptions
                         token
                         unique_number_identifier
                         updated_at
                         venmo_sdk
                         verifications
                         is_network_tokenized].freeze
  CC_DATA = {"billing-address"=>
                {"id"=>"gr",
                 "customer-id"=>499050362,
                 "first-name"=>"",
                 "last-name"=>"",
                 "company"=>"",
                 "street-address"=>"",
                 "extended-address"=>"",
                 "locality"=>"",
                 "region"=>"",
                 "postal-code"=>194295,
                 "country-code-alpha2"=>"",
                 "country-code-alpha3"=>"",
                 "country-code-numeric"=>"",
                 "country-name"=>"",
                 "phone-number"=>"",
                 "created-at"=>"2022-10-14T12:30:08Z",
                 "updated-at"=>"2022-10-14T12:30:08Z"},
              "bin"=>444433,
              "card-type"=>"Visa",
              "cardholder-name"=>"Evg",
              "commercial"=>"Unknown",
              "country-of-issuance"=>"GBR",
              "created-at"=>"2022-10-14T12:30:08Z",
              "customer-id"=>499050362,
              "customer-global-id"=>"Y3VzdG9tZXJfNDk5MDUwMzYy",
              "customer-location"=>"US",
              "debit"=>"No",
              "default"=>true,
              "durbin-regulated"=>"Unknown",
              "expiration-month"=>2,
              "expiration-year"=>2023,
              "expired"=>false,
              "global-id"=>"cGF5bWVudG1ldGhvZF9jY19wcHZocGthMw",
              "healthcare"=>"Unknown",
              "image-url"=>"https://assets.braintreegateway.com/payment_method_logo/visa.png?environment=sandbox",
              "issuing-bank"=>"Unknown",
              "last-4"=>1111,
              "payroll"=>"Unknown",
              "prepaid"=>"Unknown",
              "product-id"=>"Unknown",
              "subscriptions"=>"",
              "token"=>"ppvhpka3",
              "unique-number-identifier"=>"1b5dfe0cc1bbea9d82247213185c95a1",
              "updated-at"=>"2022-10-14T12:30:08Z",
              "venmo-sdk"=>false,
              "verifications"=>"",
              "is-network-tokenized"=>false}.freeze
  class CreditCard < Struct.new(*CC_AVAILABLE_ATTRS, keyword_init: true)
    def billing_address
      MockBraintree::BillingAddress.new(super.each_with_object({}) { |(k, v),res| res[k.underscore.to_sym] = v })
    end
  end
end
