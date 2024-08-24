require 'rails_helper'

RSpec.describe FilteringsSearchQuery do
  let(:first_drone) { create(:drone) }
  let(:second_drone) { create(:drone) }
  let!(:stations) do
    [
      create(:ac_charging_station, registration_date: Time.zone.today.beginning_of_week(:sunday), drone: first_drone),
      create(:ac_charging_station, registration_date: Time.zone.today.beginning_of_month, drone: second_drone),
      create(:ac_charging_station, registration_date: Time.zone.today.yesterday, drone: first_drone),
      create(:ac_charging_station, registration_date: Time.zone.today.end_of_day, drone: second_drone),
      create(:ac_charging_station, registration_date: Time.zone.today - 1.week, drone: first_drone)
    ]
  end
  let(:collection) { AcChargingStation.all }
  let(:query) { described_class.new }

  # rubocop:disable RSpec/MultipleMemoizedHelpers
  describe '#perform' do
    subject(:perform_query) { query.perform(collection, params) }

    context 'when filtering by drone_id' do
      let(:params) { { by_id: first_drone.id } }

      it 'returns stations with the specified drone_id' do
        expect(perform_query).to match_array(stations.select { |s| s.drone_id == first_drone.id })
      end
    end

    context 'when filtering by week' do
      let(:params) { { by_week: true } }

      it 'returns stations from the current week' do
        expected_stations = stations.select do |s|
          s.registration_date >= Time.zone.today.beginning_of_week(:sunday) &&
            s.registration_date <= Time.zone.today.end_of_day
        end
        expect(perform_query).to match_array(expected_stations)
      end
    end

    context 'when filtering by month' do
      let(:params) { { by_month: true } }

      it 'returns stations from the current month' do
        expected_stations = stations.select do |s|
          s.registration_date >= Time.zone.today.beginning_of_month && s.registration_date <= Time.zone.today.end_of_day
        end
        expect(perform_query).to match_array(expected_stations)
      end
    end

    context 'when filtering by day' do
      let(:specific_date) { Time.zone.today.yesterday.to_s }
      let(:params) { { by_day: { date: specific_date } } }

      it 'returns stations from the specified day' do
        expected_stations = stations.select { |s| s.registration_date.to_date == Date.parse(specific_date) }
        expect(perform_query).to match_array(expected_stations)
      end
    end

    context 'when filtering by current' do
      let(:params) { { by_current: true } }

      it 'returns the 5 most recent stations' do
        expected_stations = stations.sort_by(&:registration_date).last(5).reverse
        expect(perform_query).to match_array(expected_stations)
      end
    end

    context 'when filtering by personalized date range' do
      let(:start_date) { (Time.zone.today - 1.week).to_s }
      let(:end_date) { Time.zone.today.to_s }
      let(:params) { { by_personalized: { start_date:, end_date: } } }

      it 'returns stations within the specified date range' do
        expected_stations = stations.select do |s|
          s.registration_date >= Date.parse(start_date).beginning_of_day &&
            s.registration_date <= Date.parse(end_date).end_of_day
        end
        expect(perform_query).to match_array(expected_stations)
      end
    end

    context 'when combining multiple scopes' do
      let(:params) { { by_id: first_drone.id, by_week: true } }

      # rubocop:disable RSpec/ExampleLength
      it 'returns stations that match all specified scopes' do
        expected_stations = stations.select do |s|
          s.drone_id == first_drone.id &&
            s.registration_date >= Time.zone.today.beginning_of_week(:sunday) &&
            s.registration_date <= Time.zone.today.end_of_day
        end
        expect(perform_query).to match_array(expected_stations)
      end
    end

    context 'when no valid scope is provided' do
      let(:params) { { unknown_param: 'value' } }

      it 'raises an ArgumentError' do
        expect { perform_query }.to raise_error(ArgumentError, 'At least one valid scope must be provided')
      end
    end
  end
end
