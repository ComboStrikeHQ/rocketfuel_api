# frozen_string_literal: true

class RocketfuelApi::Service::Pixel < RocketfuelApi::Service
  def initialize(connection)
    @read_only = true

    super(connection)
  end

  def uri_suffix
    'pixels'
  end
end
