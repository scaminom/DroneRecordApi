class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

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
