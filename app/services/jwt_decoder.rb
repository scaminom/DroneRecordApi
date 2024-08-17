class JwtDecoder
  def initialize(token)
    @token = token
  end

  def decode
    JWT.decode(@token, Rails.application.credentials.fetch(:secret_key_base)).first
  rescue JWT::DecodeError
    nil
  end
end
