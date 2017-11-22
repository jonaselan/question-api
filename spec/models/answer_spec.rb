require 'rails_helper'

RSpec.describe Answer, type: :model do
  describe "Associations" do
    it{ is_expected.to belong_to :user }
    it{ is_expected.to belong_to :question }
  end
end
