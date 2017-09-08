# frozen_string_literal: true

class RocketfuelApi::Service::Campaign < RocketfuelApi::Service
  def initialize(connection)
    @read_only = true

    super(connection)
  end

  def uri_suffix
    'campaigns'
  end
end
