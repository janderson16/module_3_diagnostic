class NrelService
  attr_reader

  def initialize
    @connection = Faraday.new('https://api.data.gov/nrel/alt-fuel-stations/v1.json')
    auth = "?api_key=#{ENV["secret"]}"
  end

  def stations
    parse(connection.get(auth)"&location=80203&fuel_type=ELEC&limit=10")
  end

  private

  def parse
    JSON.parse(response.body)
  end

end
