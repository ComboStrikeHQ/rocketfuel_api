# frozen_string_literal: true

class RocketfuelApi::Service::ThridPartyPixelSearch < RocketfuelApi::Service
  def initialize(connection)
    @read_only = true

    super(connection)
  end

  def uri_suffix
    'thrid_party_pixels/search'
  end
end
