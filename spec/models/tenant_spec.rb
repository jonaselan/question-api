require 'rails_helper'

RSpec.describe Tenant, type: :model do
  let!(:tenant) { create(:tenant, api_token: '123') }

  context 'when create a new tenant' do
    it "the api token field should be different" do
      tenant2 = create(:tenant, api_token: '123')
      expect(tenant.api_token).to_not eq tenant2.api_token
    end
  end
end
