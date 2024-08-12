class AcChargingStation < ApplicationRecord
  belongs_to :drone

  include Filterable

  WHITELISTED_ATTRIBUTES = %i[registration_date ac_current ac_power].freeze
end