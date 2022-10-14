require 'mock_braintree'

RSpec.describe 'MockBraintree' do
  def gateway
    MockBraintree::Gateway.new
  end

  it 'instantiates a FakeBraintree object from class' do
    obj = MockBraintree::Gateway.new
    expect(obj.class).to eq(MockBraintree::Gateway)
  end

  describe 'successful results' do
    let(:result) { gateway.transaction.sale(nonce: 'fake-valid-nonce', amount: '20.00') }

    it 'creates a result object with successful response' do
      expect(result.success?).to be(true)
      expect(result.class).to eq(MockBraintree::SuccessfulResult)
    end

    it 'returns a transaction object in result object' do
      expect(result.transaction.class).to eq(MockBraintree::Transaction)
    end

    it 'returns a status in the transaction object' do
      expect(result.transaction.status).to eq('authorized')
    end

    it 'returns a transaction ID' do
      expect(result.transaction.id.length).to eq(6)
    end

    it 'returns a UTC Time object' do
      expect(result.transaction.created_at).to be_within(4).of(Time.now.utc)
    end
  end

  describe 'unsuccessful results' do
    let(:result) { gateway.transaction.sale(nonce: 'fake-valid-nonce', amount: '2000.00') }

    it 'returns an unsuccessful #success? response' do
      expect(result.success?).to be(false)
      expect(result.class).to eq(MockBraintree::UnsuccessfulResult)
    end

    it 'returns an unsuccessful status' do
      failed_result = gateway.transaction.sale(nonce: 'fake-valid-nonce', amount: '3000.00')
      expect(result.transaction.status).to eq('processor_declined')
      expect(failed_result.transaction.status).to eq('failed')
    end

    it 'returns a transaction ID' do
      expect(result.transaction.id.length).to eq(6)
    end
  end

  describe 'submit_for_settlement parameter' do
    it 'accepts an options nested hash with a submit_for_settlement value' do
      result = gateway.transaction.sale(nonce: 'fake-valid-nonce', amount: '1000.00', options: { submit_for_settlement: true })
      expect(result.transaction.status).to eq('submitted_for_settlement')
    end

    it 'returns an unsuccessful status even when there is a submit_for_settlement value passed' do
      result = gateway.transaction.sale(nonce: 'fake-valid-nonce', amount: '3000.00', options: { submit_for_settlement: true })
      expect(result.transaction.status).to eq('failed')
    end
  end

  describe '#refund' do
    let(:result) { gateway.transaction.refund('6xg32s') }
    it 'returns the transaction ID argument as the refunded_transaction_id value' do
      expect(result.transaction.refunded_transaction_id).to eq('6xg32s')
    end

    it 'returns a nil value for attributes not passed as arguments' do
      expect(result.transaction.order_id).to eq(nil)
    end

    it 'returns the amount that is passed if included' do
      result = gateway.transaction.refund('4345sx', '5.00')
      expect(result.transaction.amount).to eq('5.00')
    end

    it 'accepts and returns an order_id value' do
      result = gateway.transaction.refund('4345sx', '10.00', '64342-C')
      expect(result.transaction.order_id).to eq('64342-C')
    end

    it 'should return a status of submitted_for_settlement' do
      expect(result.transaction.status).to eq('submitted_for_settlement')
    end
  end

  describe '#void' do
    let(:result) { gateway.transaction.void('6xg32s') }
    it 'should return status of voided' do
      expect(result.transaction.status).to eq('voided')
    end
  end
end
