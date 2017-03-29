class NrelService
  attr_reader

  def initialize

  end

  def stations
    parse()
  end

  private

  def parse
    JSON.parse(response.body)
  end

end
