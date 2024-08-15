class DcChargingStation < ApplicationRecord
  belongs_to :drone

  include Filterable

  WHITELISTED_ATTRIBUTES = [:registration_date, :dc_current, :dc_power].freeze
end
