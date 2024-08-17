class ApplicationController < ActionController::API
  before_action :authenticate_user!
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity
  rescue_from ActionController::RoutingError, with: :no_route_found
  rescue_from CanCan::AccessDenied, with: :unauthorized_action
  rescue_from ActionDispatch::Http::Parameters::ParseError, with: :handle_parse_error

  def no_route_found
    route_info = "No route matches [#{request.method}] \"#{request.original_fullpath}\""
    render json: { error: route_info }.to_json, status: :not_found, layout: false
  end

  private

  def not_found(exception)
    render json: { error: exception.message }, status: :not_found
  end

  def unprocessable_entity(exception)
    render json: { error: exception.record.errors }, status: :unprocessable_entity
  end

  def unauthorized_action(exception)
    render json: { error: exception.message }, status: :forbidden
  end

  def handle_parse_error
    render json: { error: 'Invalid JSON format' }, status: :bad_request
  end

  def current_token
    request.env['warden-jwt_auth.token']
  end
end
