class NrelService
  attr_reader

  def initialize
    @connection = Faraday.new('https://api.data.gov/nrel/alt-fuel-stations/v1.json')
    auth = "?limit=10&api_key=#{ENV["secret"]}"
  end

  def stations
    parse()
  end

  private

  def parse
    JSON.parse(response.body)
  end

end
