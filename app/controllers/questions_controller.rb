class QuestionsController < ApplicationController
  before_action :authenticate

  def index
    @questions = Question.includes(:user, :answers).not_private
  end
end
