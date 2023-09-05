require 'rails_helper'

describe OmsService::Product::Updater do
  let(:brand) { create :brand, id: 888 }
  let(:new_brand) { create :brand, id: 999 }
  let(:resource) { create :product, brand_id: brand.id }
  let(:params) do
    ActionController::Parameters.new({
      brand_id: new_brand.id
    })
  end

  subject { described_class.new(resource, params) }

  describe '#exec' do
    it 'returns a ::Product' do
      result = subject.exec
      expect(result).to be_a ::Product
      expect(result.brand_id).to eq new_brand.id
    end
  end
end
