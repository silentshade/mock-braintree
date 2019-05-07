require 'securerandom'

class Transaction
  attr_reader :amount

  def initialize(hash = {})
    @amount = hash[:amount]
    @options = hash.fetch(:options, nil)
    @submit_for_settlement = submit_for_settlement
  end

  def status
    if (amount.to_f < 2000) && (submit_for_settlement == true)
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

  private

  def submit_for_settlement
    if @options != nil
      @options.fetch(:submit_for_settlement, false)
    else
      false
    end
  end
end
