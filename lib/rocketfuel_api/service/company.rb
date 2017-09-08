# frozen_string_literal: true

class RocketfuelApi::Service::Company < RocketfuelApi::Service
  def initialize(connection)
    @read_only = true

    super(connection)
  end

  def uri_suffix
    'companies'
  end
end
