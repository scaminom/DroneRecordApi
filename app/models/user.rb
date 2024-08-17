class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :registerable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  # Enum
  enum role: { user: 0, admin: 1 }

  # Associations
  has_many :drones, dependent: :destroy

  # Validations
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { is: 6 }, on: :create

  validates :role, presence: true, inclusion: { in: roles.keys }

  validates :first_name, :last_name, format: { with: /\A[a-zA-Z]+\z/ }

  WHITELISTED_ATTRIBUTES = [
    :username,
    :email,
    :password,
    :role,
    :first_name,
    :last_name
  ].freeze

  WHITELISTED_ATTRIBUTES_REGISTRATION = [
    :username,
    :email,
    :password,
    :first_name,
    :last_name
  ].freeze

  def jwt_payload
    super.merge('first_name' => first_name,
                'last_name'  => last_name,
                'role'       => role)
  end
end
