class DcChargingStation < ApplicationRecord
  belongs_to :drone

  include Filterable

  WHITELISTED_ATTRIBUTES = %i[registration_date dc_current dc_power].freeze
end
