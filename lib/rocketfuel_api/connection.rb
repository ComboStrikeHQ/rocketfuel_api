# frozen_string_literal: true

class RocketfuelApi::Connection
  def initialize(config)
    @config = config
    @config[:uri] ||= 'https://api-sandbox.rocketfuel.com/2016'

    @connection = Faraday.new(@config[:uri]) do |conn|
      conn.request :json
      conn.response :json, content_type: /\bjson$/
      conn.use RocketfuelApi::Faraday::Response::RaiseHttpError
      conn.adapter Faraday.default_adapter
      conn.headers['X-Auth-Token'] = @config[:auth_token]
    end
  end

  def get(uri_suffix, params = {})
    @connection.get(uri_suffix, params)
  end

  def post(uri_suffix, params = {})
    @connection.post(uri_suffix, params)
  end
end
