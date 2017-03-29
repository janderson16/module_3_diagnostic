require 'rails_helper'

describe NrelService do
  attr_reader :service

  before(:each) do
    @service = NrelService.new
  end

  describe '#nearest_stations' do
    it 'returns nearest stations' do
      # VCR.use_cassette("services/search_function") do
        stations = @service.nearest_stations
        station = stations.first

        expect(stations.count).to eq(10)
        expect(station.name).to eq("U-Haul")
        expect(station.address).to eq("2000 W Lower Colfax Ave")
        expect(station.fuel_type_code).to eq("LPG")
        expect(station.distance).to eq("0.57674")
        expect(station.access_days_time).to eq("7am-7pm M-Th and Sat, 7am-8pm F, 9am-5pm Sun")
      # end
    end
  end
end
