require 'rails_helper'

RSpec.describe SolarPanel do
  describe 'associations' do
    it { is_expected.to belong_to(:drone) }
  end

  describe 'validations' do
    subject { build(:solar_panel) }

    it { is_expected.to validate_presence_of(:registration_date) }

    it { is_expected.to validate_presence_of(:panel_voltage) }
    it { is_expected.to validate_numericality_of(:panel_voltage).is_greater_than_or_equal_to(0) }

    it { is_expected.to validate_presence_of(:panel_current) }
    it { is_expected.to validate_numericality_of(:panel_current).is_greater_than_or_equal_to(0) }

    it { is_expected.to validate_presence_of(:battery_voltage) }
    it { is_expected.to validate_numericality_of(:battery_voltage).is_greater_than_or_equal_to(0) }

    it { is_expected.to validate_presence_of(:battery_current) }
    it { is_expected.to validate_numericality_of(:battery_current).is_greater_than_or_equal_to(0) }

    it { is_expected.to validate_presence_of(:controller_voltage) }
    it { is_expected.to validate_numericality_of(:controller_voltage).is_greater_than_or_equal_to(0) }

    it { is_expected.to validate_presence_of(:controller_current) }
    it { is_expected.to validate_numericality_of(:controller_current).is_greater_than_or_equal_to(0) }
  end

  describe 'allowed params' do
    it {
      expect(SolarPanel::WHITELISTED_PARAMS).to eq([:registration_date, :panel_voltage, :panel_current, :battery_voltage,
                                                    :battery_current, :controller_voltage, :controller_current, :drone_id])
    }
  end
end
