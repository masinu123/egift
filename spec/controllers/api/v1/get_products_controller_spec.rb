require 'rails_helper'

describe Api::V1::GetProductsController, type: :request do
  describe 'get /v1/products' do
    let(:user) { create :user }
    let(:product) { create :product }
    let!(:product_manage) { create :product_manage, user_id: user.id, product_id: product.id }
    let(:params) do
      {
        user_id: user.id
      }
    end
    let(:action)  { get '/v1/products', params: params }

    context 'when success' do
      it 'responds status 200 and right schema' do
        action
        expect(response.status).to eq 200

        body = JSON.parse(response.body)
        expect(body).to have_key 'data'
        expect(body['data'][0]).to have_key 'name'
        expect(body['data'][0]).to have_key 'brand'
      end
    end
  end
end
