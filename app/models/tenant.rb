class Tenant < ApplicationRecord
  before_create :generate_access_token

  private

  def generate_access_token
    begin
      self.api_token = SecureRandom.hex 16
    end while self.class.exists?(api_token: api_token)
  end
end
