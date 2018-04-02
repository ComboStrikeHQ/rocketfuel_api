# frozen_string_literal: true

class RocketfuelApi::Service::Reporting < RocketfuelApi::Service
  def run(params = {})
    params = {
      use_campaign_currency: 'true',
      use_campaign_time_zone: 'true'
    }.merge(params)
    response = @connection.post(uri_suffix, params)
    parse_response(response.body)
  end
end
