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

    it 'creates a result object with unsuccessful response' do
      expect(result.success?).to be(true)
    end

    it 'returns a transaction object in result object' do
      expect(result.transaction.class).to eq(Transaction)
    end

    it 'returns a status in the transaction object' do
      expect(result.transaction.status).to eq('authorized')
    end

    it 'returns a transaction ID' do
      expect(result.transaction.id.length).to eq(6)
    end
  end

  describe 'unsuccessful results' do
    let(:result) { gateway.transaction.sale(nonce: 'fake-valid-nonce', amount: '2000.00') }
    it 'returns an unsuccessful #success? response' do
      expect(result.success?).to be(false)
    end

    it 'returns an unsuccessful status' do
      failed_result = gateway.transaction.sale(nonce: 'fake-valid-nonce', amount: '3000.00')
      expect(result.status).to eq('processor_declined')
      expect(failed_result.status).to eq('failed')
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
end
