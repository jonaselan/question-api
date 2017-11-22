require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
  before do
    create(:question)
    create(:private_question)
  end

  describe "GET #index" do
    it "returns questions no private only" do
      get :index, format: :json
      expect(json_response['questions'].count).to eq 1
    end
  end
end
