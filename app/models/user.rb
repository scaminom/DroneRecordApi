class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  devise :database_authenticatable, :registerable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  has_many :uavs, dependent: :destroy

  WHITELISTED_ATTRIBUTES = %i[
    username
    email
    password
    role
    first_name
    last_name
  ].freeze

  WHITELISTED_ATTRIBUTES_REGISTRATION = %i[
    username
    email
    password
    first_name
    last_name
  ].freeze

  enum role: {
    'user': 0,
    'admin': 1
  }
end
