# frozen_string_literal: true

require 'faraday_middleware'

require 'rocketfuel_api/error'
require 'rocketfuel_api/faraday/raise_http_error'

require 'rocketfuel_api/connection'
require 'rocketfuel_api/service'
require 'rocketfuel_api/resource'
require 'rocketfuel_api/version'

module RocketfuelApi
  AUTOLOAD_PATHS = [
    Dir[File.dirname(__dir__) + '/lib/rocketfuel_api/resource/*.rb'],
    Dir[File.dirname(__dir__) + '/lib/rocketfuel_api/service/*.rb']
  ].flatten.freeze

  def self.root
    Pathname.new(File.dirname(__dir__))
  end

  AUTOLOAD_PATHS.each { |file| require file }
end
