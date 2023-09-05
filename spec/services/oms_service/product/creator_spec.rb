require 'rails_helper'

describe OmsService::Product::Creator do
  let(:brand) { create :brand }
  let(:meta) do
    {
      country: 'Singapore'
    }
  end
  let(:params) do
    ActionController::Parameters.new({
      name: 'B1',
      brand_id: brand.id,
      meta: meta
    })
  end

  subject { described_class.new(params) }

  describe '#exec' do
    it 'returns a ::Product' do
      result = subject.exec
      expect(result).to be_a ::Product
      expect(result.name).to eq 'B1'
      expect(result.meta).to be_a Hash
      expect(result.brand_id).to eq brand.id
      expect(result.meta['country']).to eq 'Singapore'
    end

    it 'increases ::Product count' do
      expect{subject.exec}.to change{::Product.count}.by(1)
    end
  end
end
