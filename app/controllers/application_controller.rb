class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  protected

  def authenticate
    (authenticate_http || authenticate_params) || render_unauthorized
  end

  def authenticate_params
    @tenant = Tenant.find_by_api_token(params[:api_token])
  end

  def authenticate_http
    authenticate_with_http_token do |token, options|
      aux = Tenant.exists?(api_token: token)
      @tenant = Tenant.find_by_api_token(token) if aux
    end
  end

  def render_unauthorized(realm = "Application")
    self.headers["WWW-Authenticate"] = %(Token realm="#{realm.gsub(/"/, "")}")
    render json: {
      code: 401,
      message: 'Unauthorized! Report a valid token, please'
    }, status: :unauthorized
  end
end
