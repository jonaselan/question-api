class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  protected

  def authenticate
    (authenticate_http || authenticate_params) || render_unauthorized
  end

  def authenticate_params
    Tenant.find_by_api_token(params[:api_token])
  end

  def authenticate_http
    authenticate_with_http_token do |token, options|
      Tenant.exists?(api_token: token)
    end
  end

  def render_unauthorized(realm = "Application")
    self.headers["WWW-Authenticate"] = %(Token realm="#{realm.gsub(/"/, "")}")
    render json: {
      Code: 401,
      message: 'Bad credentials'
    }, status: :unauthorized
  end
end
