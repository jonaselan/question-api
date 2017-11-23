require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
  before do
    create(:question, body: 'teste')
    create(:question, body: 'question')
    create(:private_question)
  end
  let(:tenant) { create(:tenant) }

  describe "GET #index" do
    context 'when the tenant passing a api key valid' do
      it "returns only questions no private" do
        get :index, params: {api_token: tenant.api_token}, format: :json
        expect(json_response['questions'].count).to eq 2
      end

      it "increment one on tenant's request count" do
        get :index, params: {api_token: tenant.api_token}, format: :json
        tenant.reload
        expect(tenant.request_counts).to eq 1
      end

      context 'and passing a parameter for search' do
        it 'term match and return result' do
          get :index, params: {api_token: tenant.api_token, q: 'test'}, format: :json
          expect(json_response['questions'][0]['body']).to eq 'teste'
        end
        it 'term match and return result' do
          get :index, params: {api_token: tenant.api_token, q: 'test,questi'}, format: :json
          expect(json_response['questions'][0]['body']).to eq 'teste'
          expect(json_response['questions'][1]['body']).to eq 'question'
        end
        it 'term don\'t match and return 404 message' do
          get :index, params: {api_token: tenant.api_token, q: 'ssss'}, format: :json
          expect(response).to have_http_status(:not_found)
          expect(json_response['code']).to eq 404
        end
      end

      it "increment one on tenant's request count" do
        get :index, params: {api_token: tenant.api_token}, format: :json
        tenant.reload
        expect(tenant.request_counts).to eq 1
      end
    end
    context 'when the tenant passing a api key invalid' do
      it "return a unauthorized message" do
        get :index, format: :json
        expect(response).to have_http_status(:unauthorized)
        expect(json_response['code']).to eq 401
      end
    end
  end
end
