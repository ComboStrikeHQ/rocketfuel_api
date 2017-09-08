# frozen_string_literal: true

class RocketfuelApi::Service::AdvertisementCard < RocketfuelApi::Service
  def initialize(connection)
    @read_only = true

    super(connection)
  end

  def uri_suffix
    'ads/cards'
  end
end
