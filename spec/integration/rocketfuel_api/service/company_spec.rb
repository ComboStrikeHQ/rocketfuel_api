# frozen_string_literal: true

require 'spec_helper'

RSpec.describe RocketfuelApi::Service::Company, :vcr do
  subject(:service) { described_class.new(connection) }

  let(:connection) do
    RocketfuelApi::Connection.new(
      auth_token: ENV.fetch('ROCKETFUEL_API_SANDBOX_AUTH_TOKEN')
    )
  end

  it 'receives a single company' do
    response = service.get(1)

    expect(response.id).to eq(1)
    expect(response.name).to eq('Sample Company')
    expect(response.is_active).to be(true)
  end

  it 'receives multiple companies' do
    response = service.get_all

    expect(response.first.id).to eq(1)
    expect(response.first.name).to eq('Sample Company')
    expect(response.first.is_active).to be(true)

    expect(response[1].id).to eq(2)
    expect(response[1].name).to eq('Sandbox Company')
    expect(response[1].is_active).to be(false)
  end

  it 'receives an http status error' do
    expect { service.get(999999) }
      .to raise_error(RocketfuelApi::BadRequest, 'Caught exception on GET')
  end
end
