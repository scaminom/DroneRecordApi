require 'rails_helper'

RSpec.describe DroneData do
  subject { build(:drone_data) }

  describe 'assosiation' do
    it { is_expected.to belong_to(:drone) }
  end

  # rubocop:disable RSpec/NamedSubject
  describe 'validations' do
    it { is_expected.to validate_presence_of(:registration_date) }

    it { is_expected.to validate_presence_of(:voltage) }
    it { is_expected.to validate_numericality_of(:voltage).is_greater_than_or_equal_to(0) }

    it { is_expected.to validate_presence_of(:battery_percentage) }

    it {
      expect(subject).to validate_numericality_of(:battery_percentage).is_greater_than_or_equal_to(0)
        .is_less_than_or_equal_to(100)
    }

    it { is_expected.to validate_presence_of(:current) }
    it { is_expected.to validate_numericality_of(:current).is_greater_than_or_equal_to(0) }

    it { is_expected.to validate_presence_of(:flight_mode) }
    it { is_expected.to validate_length_of(:flight_mode).is_at_most(50) }

    it { is_expected.to validate_presence_of(:speed) }
    it { is_expected.to validate_numericality_of(:speed).is_greater_than_or_equal_to(0) }

    it { is_expected.to validate_presence_of(:altitude) }
    it { is_expected.to validate_numericality_of(:altitude).is_greater_than_or_equal_to(0) }

    it { is_expected.to validate_presence_of(:latitude) }
    it { is_expected.to validate_numericality_of(:latitude).is_greater_than_or_equal_to(-90).is_less_than_or_equal_to(90) }

    it { is_expected.to validate_presence_of(:longitude) }

    it {
      expect(subject).to validate_numericality_of(:longitude).is_greater_than_or_equal_to(-180).is_less_than_or_equal_to(180)
    }
  end

  describe 'allowed params' do
    # rubocop:disable RSpec/ExampleLength
    it 'has correct WHITELISTED_ATTRIBUTES' do
      expect(described_class::WHITELISTED_PARAMS).to include(
        :registration_date,
        :voltage,
        :battery_percentage,
        :current,
        :flight_mode,
        :speed,
        :altitude,
        :latitude,
        :longitude,
        :drone_id
      )
    end
  end
end
