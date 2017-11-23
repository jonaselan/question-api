require 'rails_helper'

describe Rack::Attack do
  include Rack::Test::Methods

  def app
    Rails.application
  end

  describe "throttle excessive requests by IP address" do
    let(:limit) { 100 }

    context "number of requests is lower than the limit" do
      it "does not change the request status" do
        limit.times do
          get "/", {}, "REMOTE_ADDR" => "1.2.3.4"
          expect(last_response.status).to eq(200)
        end
      end
    end

    context "number of requests is higher than the limit" do
      it "changes the request status to 403" do
        (limit + 1).times do |i|
          get "/", {}, "REMOTE_ADDR" => "1.2.3.5"
          expect(last_response.status).to eq(403) if i > limit
        end
      end
    end
  end

end
