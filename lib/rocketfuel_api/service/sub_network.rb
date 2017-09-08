# frozen_string_literal: true

class RocketfuelApi::Service::SubNetwork < RocketfuelApi::Service
  def initialize(connection)
    @read_only = true

    super(connection)
  end

  def uri_suffix
    'sub_networks'
  end
end
