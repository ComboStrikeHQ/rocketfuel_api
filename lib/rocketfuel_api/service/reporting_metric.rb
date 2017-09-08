# frozen_string_literal: true

class RocketfuelApi::Service::ReportingMetric < RocketfuelApi::Service
  def initialize(connection)
    @read_only = true

    super(connection)
  end

  def uri_suffix
    'reports/metrics'
  end
end
