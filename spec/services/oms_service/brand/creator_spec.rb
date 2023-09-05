require 'rails_helper'

describe OmsService::Brand::Creator do
  let(:meta) do
    {
      country: 'Singapore'
    }
  end
  let(:params) do
    ActionController::Parameters.new({
      name: 'B1',
      meta: meta
    })
  end

  subject { described_class.new(params) }

  describe '#exec' do
    it 'returns a ::Brand' do
      result = subject.exec
      expect(result).to be_a ::Brand
      expect(result.name).to eq 'B1'
      expect(result.meta).to be_a Hash
      expect(result.meta['country']).to eq 'Singapore'
    end

    it 'increases ::Brand count' do
      expect{subject.exec}.to change{::Brand.count}.by(1)
    end
  end
end
