require 'rails_helper'

describe OmsService::Brand::Deactivate do
  let(:resource) { create :brand, name: 'B1', state: 'active' }

  subject { described_class.new(resource) }

  describe '#exec' do
    it 'returns a ::Brand' do
      result = subject.exec
      expect(result).to be_a ::Brand
      expect(result.state).to eq 'inactive'
    end

    context 'when has some product associate' do
      let!(:product) { create :product, name: 'P1', state: 'active', brand_id: resource.id }

      it 'deactivates associate product' do
        result = subject.exec
        product.reload
        expect(product.state).to eq 'inactive'
      end
    end
  end
end
