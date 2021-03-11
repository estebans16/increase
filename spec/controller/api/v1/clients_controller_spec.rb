require('rails_helper')

RSpec.describe('Api::V1::ClientesController', type: :request) do
  let(:valid_attributes) {
    FactoryBot.attributes_for(:client)
  }

  let(:valid_headers) {
    { 'Authorization': "Bearer #{ENV['API_TOKEN']}" }
  }

  before(:each) do
    @users = FactoryBot.create_list(:client_with_payments, 2)
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      get api_v1_clients_url, headers: valid_headers, as: :json
      expect(response).to(be_successful)
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      get api_v1_clients_url(@users.first), headers: valid_headers, as: :json
      expect(response).to(be_successful)
    end
  end

  describe 'GET /payments' do
    it 'renders a successful response' do
      get '/api/v1/clients/#{@users.first.external_client_id}/payments', headers: valid_headers, as: :json
      expect(response).to(be_successful)
    end
  end

  describe 'GET /transactions' do
    it 'renders a successful response' do
      payment_id = @users.first.payments.first.id
      get '/api/v1/clients/#{@users.first.external_client_id}/payments/#{payment_id}/transactions', headers: valid_headers, as: :json
      expect(response).to(be_successful)
    end
  end

  describe 'GET /received_money' do
    it 'renders a successful response' do
      get '/api/v1/clients/#{@users.last.external_client_id}/received_money', headers: valid_headers, as: :json
      expect(response).to(be_successful)
    end
  end

  describe 'GET /money_to_receive' do
    it 'renders a successful response' do
      get '/api/v1/clients/#{@users.first.external_client_id}/money_to_receive', headers: valid_headers, as: :json
      expect(response).to(be_successful)
    end
  end
end
