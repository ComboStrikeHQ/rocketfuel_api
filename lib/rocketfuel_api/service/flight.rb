# frozen_string_literal: true

class RocketfuelApi::Service::Flight < RocketfuelApi::Service
  def initialize(connection)
    @read_only = true

    super(connection)
  end

  def uri_suffix
    'flights'
  end
end
