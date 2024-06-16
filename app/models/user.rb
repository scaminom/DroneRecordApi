class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  devise :database_authenticatable, :registerable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  has_many :uavs

  WHITELISTED_ATTRIBUTES = %i[
    username
    email
    password
    role
    nombre
    apellido
  ].freeze

  enum role: {
    'user': 0,
    'admin': 1
  }
end
