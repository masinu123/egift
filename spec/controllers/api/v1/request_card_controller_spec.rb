require 'rails_helper'

describe Api::V1::RequestCardController, type: :request do
  describe 'get /v1/request_card' do
    let(:user) { create :user }
    let(:product) { create :product }
    
    let(:params) do
      {
        product_id: product.id,
        user_id: user.id,
        name: 'name',
        code: 'code',
        pin_code: 'pin_code',
        expires_at: Time.zone.now
      }
    end
    let(:action)  { get '/v1/request_card', params: params }

    context 'when success' do
      it 'responds status 200 and right schema' do
        action
        expect(response.status).to eq 200

        body = JSON.parse(response.body)
        expect(body).to have_key 'data'
        expect(body['data']).to have_key 'name'
        expect(body['data']).to have_key 'state'
        expect(body['data']['state']).to eq 'draft'
      end
    end
  end
end
