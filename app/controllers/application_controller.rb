class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActionController::RoutingError, with: :no_route_found
  rescue_from ArgumentError, with: :handle_argument_error
  rescue_from CanCan::AccessDenied, with: :unauthorized_action

  def no_route_found
    route_info = "No route matches [#{request.method}] \"#{request.original_fullpath}\""
    render json: { error: route_info }.to_json, status: :not_found, layout: false
  end

  private

  def not_found(exception)
    render json: { error: exception.message }, status: :not_found
  end

  def handle_argument_error(exception)
    render json: { error: "Invalid argument: #{exception.message}" }, status: :unprocessable_entity
  end

  def unauthorized_action
    render json: { error: 'You are not allowed to performance this action' }, status: :unauthorized
  end
end
