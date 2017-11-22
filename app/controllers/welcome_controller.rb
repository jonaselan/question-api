class WelcomeController < ApplicationController
  def index
    render json: { message: 'The Question API is running!' }
  end
end
