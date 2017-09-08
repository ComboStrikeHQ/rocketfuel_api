# frozen_string_literal: true

class RocketfuelApi::Service::LineItem < RocketfuelApi::Service
  def initialize(connection)
    @read_only = true

    super(connection)
  end

  def uri_suffix
    'line_items'
  end
end
