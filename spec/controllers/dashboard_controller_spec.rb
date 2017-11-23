require 'rails_helper'

RSpec.describe DashboardController, type: :controller do

  before do
    u1 = User.create(name: 'fulano1')
    u2 = User.create(name: 'fulano2')
    q2 = Question.create(body: 'nao', user: u2)
    Answer.create(body: 'resposta a sim', user: u1, question: q2)
  end

  describe "GET #index" do
    it "returns only questions no private" do
      get :index, format: :json
      json = json_response['dashboard']
      expect(json['users_count']).to eq 2
      expect(json['questions_count']).to eq 2
      expect(json['answers_count']).to eq 1
    end
  end
end
