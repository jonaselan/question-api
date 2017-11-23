class QuestionsController < ApplicationController
  before_action :authenticate, unless: -> { ENV['DISABLE_AUTH'] }
  after_action  :increment_request

  def index
    @questions = Question.includes(:user, :answers).not_private
    search if params[:q]
  end

  private

  def search
    @questions = @questions.search_by params[:q].delete(" \t\r\n")
    render_not_found if @questions.empty?
  end

  def increment_request
    @tenant.increment!(:request_counts)
  end
end
