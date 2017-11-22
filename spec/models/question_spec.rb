require 'rails_helper'

RSpec.describe Question, type: :model do
  describe "Associations" do
    it{ is_expected.to belong_to :user }
    it{ is_expected.to have_many :answers }
  end
end
