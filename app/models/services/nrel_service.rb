class NrelService
  attr_reader :connection, :auth

  def initialize
    @connection = Faraday.new('https://api.data.gov/nrel/alt-fuel-stations/v1/nearest.json')
    @auth = "?api_key=#{ENV["secret"]}"
  end

  def nearest_stations(location)
    binding.pry
    parse(connection.get(auth)"&location=#{location}&fuel_type=ELEC,LPG&radius=6&limit=10")
  end

  private

  def parse
    JSON.parse(response.body, symbolize_names: true)
  end

end
