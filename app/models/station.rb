class Station < OpenStruct
  attr_reader :service

  def self.service
    @service ||= NrelService.new
  end



end
