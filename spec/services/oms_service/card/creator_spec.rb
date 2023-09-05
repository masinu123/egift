require 'rails_helper'

describe OmsService::Card::Creator do
  let!(:now) { Time.zone.now }
  let(:params) do
    {
      product_id: 1,
      user_id: 1,
      name: 'name',
      code: 'code',
      pin_code: 'pin_code',
      expires_at: now
    }
  end

  subject { described_class.new(params) }

  describe '#exec' do
    it 'returns a ::Card' do
      result = subject.exec
      expect(result).to be_a ::Card
      expect(result.name).to eq 'name'
      expect(result.state).to eq 'draft'
      expect(result.expires_at).to eq now
    end

    it 'increases ::Card count' do
      expect{subject.exec}.to change{::Card.count}.by(1)
    end
  end
end
