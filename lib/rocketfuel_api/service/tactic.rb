# frozen_string_literal: true

class RocketfuelApi::Service::Tactic < RocketfuelApi::Service
  def initialize(connection)
    @read_only = true

    super(connection)
  end

  def uri_suffix
    'tactics'
  end
end
