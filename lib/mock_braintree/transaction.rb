require 'securerandom'
module MockBraintree
  class Transaction
    attr_reader :amount, :created_at, :order_id, :refunded_transaction_id

    def initialize(hash = {})
      @amount = hash[:amount]
      @options = hash.fetch(:options, nil)
      @order_id = hash.fetch(:order_id, nil)
      @submit_for_settlement = submit_for_settlement
      @created_at = Time.now.utc
      @refunded_transaction_id = hash.fetch(:id, nil)
      @void = hash.fetch(:void, false)
    end

    def status
      if @void == true
        'voided'
      elsif (amount.to_f < 2000) && (submit_for_settlement == true)
        'submitted_for_settlement'
      elsif (amount.to_f < 2000) && (submit_for_settlement == false)
        'authorized'
      elsif (amount.to_f >= 2000) && amount.to_i < 3000
        'processor_declined'
      elsif (amount.to_f >= 3000) && amount.to_i <= 3000.99
        'failed'
      else
        'authorized'
      end
    end

    def id
      @id ||= SecureRandom.hex(3)
    end

    def avs_error_response_code; end

    def avs_postal_code_response_code
      'M'
    end

    def avs_street_address_response_code
      'M'
    end

    private

    def submit_for_settlement
      if @options != nil
        @options.fetch(:submit_for_settlement, false)
      else
        false
      end
    end
  end
end
