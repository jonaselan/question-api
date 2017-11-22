require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
  before do
    create(:question)
    create(:private_question)
  end
  let(:tenant) { create(:tenant) }

  describe "GET #index" do
    it "returns questions no private only" do
      get :index, params: {api_token: tenant.api_token}, format: :json
      expect(json_response['questions'].count).to eq 1
    end
  end
end
