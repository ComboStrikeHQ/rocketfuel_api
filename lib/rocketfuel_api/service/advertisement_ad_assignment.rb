# frozen_string_literal: true

class RocketfuelApi::Service::AdvertisementAdAssignment < RocketfuelApi::Service
  def initialize(connection)
    @read_only = true

    super(connection)
  end

  def uri_suffix
    'ads/ad_assignments'
  end
end
