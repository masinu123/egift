require 'rails_helper'

describe OmsService::Brand::Updater do
  let(:resource) { create :brand, name: 'B1', meta: {country: 'Singapore'} }
  let(:meta) do
    {
      country: '',
      currency: 'VND'
    }
  end
  let(:params) do
    ActionController::Parameters.new({
      name: 'B1',
      meta: meta
    })
  end

  subject { described_class.new(resource, params) }

  describe '#exec' do
    it 'returns a ::Brand' do
      result = subject.exec
      expect(result).to be_a ::Brand
      expect(result.name).to eq 'B1'
      expect(result.meta).to be_a Hash
      expect(result.meta['currency']).to eq 'VND'
    end
  end
end
