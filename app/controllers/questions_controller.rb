class QuestionsController < ApplicationController
  before_action :authenticate
  after_action  :increment_request

  def index
    @questions = Question.includes(:user, :answers).not_private
  end

  private

  def increment_request
    @tenant.increment!(:request_counts)
  end
end
