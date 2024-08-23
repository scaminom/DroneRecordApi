class AcChargingStation < ApplicationRecord
  include Filterable

  belongs_to :drone

  validates :registration_date, presence: true
  validates :ac_current, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :ac_power, presence: true, numericality: { greater_than_or_equal_to: 0 }

  WHITELISTED_ATTRIBUTES = [:registration_date, :ac_current, :ac_power, :drone_id].freeze
end
