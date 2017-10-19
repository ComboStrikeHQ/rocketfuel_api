# frozen_string_literal: true

require 'dotenv'
Dotenv.load('.env.test', '.env')

require 'bundler/setup'
require 'rocketfuel_api'
require 'vcr'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

VCR.configure do |c|
  c.configure_rspec_metadata!

  c.cassette_library_dir = RocketfuelApi.root.join('spec', 'fixtures', 'vcr')
  c.hook_into :webmock

  c.default_cassette_options = { allow_unused_http_interactions: false }

  c.before_record do |i|
    i.request.headers.delete('X-Auth-Token')
    i.response.headers.delete('Set-Cookie')
    i.response.headers.delete('X-Auth-Token')
  end

  c.filter_sensitive_data('rocketfuel-api-sandbox-auth-token') do
    ENV['ROCKETFUEL_API_SANDBOX_AUTH_TOKEN']
  end
end
