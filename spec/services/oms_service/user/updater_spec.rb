require 'rails_helper'

describe OmsService::User::Updater do
  let(:product) { create :product }
  let(:resource) { create :user }
  let(:params) do
    {
      payout_rate: 10,
      products: ['', product.id.to_s]
    }
  end

  subject { described_class.new(resource, params) }

  describe '#exec' do
    it 'returns a ::User' do
      result = subject.exec
      expect(result).to be_a ::User
      expect(result.payout_rate).to eq 10
    end

    it 'increases ::ProductManage count' do
      expect{subject.exec}.to change{::ProductManage.count}.by(1)
    end
  end
end
