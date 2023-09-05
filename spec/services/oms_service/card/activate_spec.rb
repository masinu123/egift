require 'rails_helper'

describe OmsService::Card::Activate do
  let(:resource) { create :card, state: 'draft' }

  subject { described_class.new(resource) }

  describe '#exec' do
    it 'returns a ::Card' do
      result = subject.exec
      expect(result).to be_a ::Card
      expect(result.state).to eq 'active'
    end
  end
end
