class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  devise :database_authenticatable, :registerable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  WHITELISTED_ATTRIBUTES = %i[
    username
    email
    password
    role
    first_name
    last_name
  ].freeze

  enum role: {
    'user': 0,
    'admin': 1
  }
end
