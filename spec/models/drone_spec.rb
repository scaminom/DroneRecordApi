require 'rails_helper'

RSpec.describe Drone do
  subject { build(:drone) }

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:solar_panels).dependent(:destroy) }
    it { is_expected.to have_many(:ac_charging_stations).dependent(:destroy) }
    it { is_expected.to have_many(:dc_charging_stations).dependent(:destroy) }
    it { is_expected.to have_many(:drones_data).dependent(:destroy).class_name('DroneData') }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_least(3).is_at_most(50) }

    it { is_expected.to validate_length_of(:description).is_at_most(500).allow_nil }

    it { is_expected.to validate_presence_of(:serial_number) }
    it { is_expected.to validate_uniqueness_of(:serial_number).case_insensitive }
    it { is_expected.to validate_length_of(:serial_number).is_at_most(255) }

    it { is_expected.to validate_presence_of(:battery_capacity) }
    it { is_expected.to validate_numericality_of(:battery_capacity).is_greater_than_or_equal_to(0) }

    it { is_expected.to validate_numericality_of(:max_wind_speed).is_greater_than_or_equal_to(0).allow_nil }

    it { is_expected.to validate_presence_of(:drone_type) }
    it { is_expected.to define_enum_for(:drone_type).with_values(%w[multirotor ala_fija]) }

    it { is_expected.to validate_presence_of(:board_type) }
    it { is_expected.to define_enum_for(:board_type).with_values(%w[arduino berrypi]) }
  end

  describe 'constants' do
    it 'has correct WHITELISTED_ATTRIBUTES' do
      expect(Drone::WHITELISTED_ATTRIBUTES).to eq([:id, :name, :description, :serial_number, :drone_type, :battery_capacity,
                                                   :board_type, :max_wind_speed, :user_id])
    end
  end
end
