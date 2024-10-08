require 'rails_helper'

RSpec.describe DcChargingStation do
  subject { build(:dc_charging_station) }

  describe 'associations' do
    it { is_expected.to belong_to(:drone) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:registration_date) }

    it { is_expected.to validate_presence_of(:dc_current) }
    it { is_expected.to validate_numericality_of(:dc_current).is_greater_than_or_equal_to(0) }

    it { is_expected.to validate_presence_of(:dc_power) }
    it { is_expected.to validate_numericality_of(:dc_power).is_greater_than_or_equal_to(0) }
  end

  describe 'constants' do
    it 'has correct WHITELISTED_ATTRIBUTES' do
      expect(DcChargingStation::WHITELISTED_ATTRIBUTES).to eq([:registration_date, :dc_current, :dc_power, :drone_id])
    end
  end
end
