require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Associations" do
    it{ is_expected.to have_many :answers }
    it{ is_expected.to have_many :questions }
  end
end
