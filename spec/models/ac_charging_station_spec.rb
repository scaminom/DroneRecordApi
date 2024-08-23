require 'rails_helper'

RSpec.describe AcChargingStation do
  subject { build(:ac_charging_station) }

  describe 'associations' do
    it { is_expected.to belong_to(:drone) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:registration_date) }

    it { is_expected.to validate_presence_of(:ac_current) }
    it { is_expected.to validate_numericality_of(:ac_current).is_greater_than_or_equal_to(0) }

    it { is_expected.to validate_presence_of(:ac_power) }
    it { is_expected.to validate_numericality_of(:ac_power).is_greater_than_or_equal_to(0) }
  end

  describe 'constants' do
    it 'has correct WHITELISTED_ATTRIBUTES' do
      expect(AcChargingStation::WHITELISTED_ATTRIBUTES).to eq([:registration_date, :ac_current, :ac_power, :drone_id])
    end
  end
end
