require 'rails_helper'

describe Api::V1::GetCardsController, type: :request do
  describe 'get /v1/cards' do
    let(:user) { create :user }
    let!(:card) { create :card, user_id: user.id }
    let(:params) do
      {
        user_id: user.id
      }
    end
    let(:action)  { get '/v1/cards', params: params }

    context 'when success' do
      it 'responds status 200 and right schema' do
        action
        expect(response.status).to eq 200

        body = JSON.parse(response.body)
        expect(body).to have_key 'data'
        expect(body['data'][0]).to have_key 'name'
        expect(body['data'][0]).to have_key 'product_name'
      end
    end
  end
end
