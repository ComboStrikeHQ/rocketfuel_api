# RocketfuelApi

Client library for [Rocketfuel API](https://api.rocketfuel.com)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rocketfuel_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rocketfuel_api

## Usage

```ruby
# for development/specs (the default uri is: https://api-sandbox.rocketfuel.com/2016)
connection = RocketfuelApi::Connection.new(
  auth_token: ENV['ROCKETFUEL_API_SANDBOX_AUTH_TOKEN']
)

# for production
connection = RocketfuelApi::Connection.new(
  uri: 'https://api.rocketfuel.com/2016'
  auth_token: ENV['ROCKETFUEL_API_AUTH_TOKEN']
)

service = RocketfuelApi::Service::Company.new(connection)
service.get(10) # returns the company with the ID 10
service.get_all # returns all companies
```

Also the `spec/integration` directory contains examples.

Note: Only the `Company` Service `GET` requests are tested so far.

## Development

To be able to run the specs, the env var `ROCKETFUEL_API_SANDBOX_AUTH_TOKEN` is needed.

We run rake rubocop to make sure, everything looks good.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ad2games/rocketfuel_api.
