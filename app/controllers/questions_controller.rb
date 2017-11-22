class QuestionsController < ApplicationController
  before_action :authenticate, unless: -> { ENV['DISABLE_AUTH'] }

  def index
    @questions = Question.includes(:user, :answers).not_private
  end
end
