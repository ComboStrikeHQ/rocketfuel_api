# frozen_string_literal: true

require 'spec_helper'

RSpec.describe RocketfuelApi::Service::Reporting, :vcr do
  subject(:service) { described_class.new(connection) }

  let(:connection) do
    RocketfuelApi::Connection.new(
      auth_token: ENV.fetch('ROCKETFUEL_API_SANDBOX_AUTH_TOKEN')
    )
  end

  context 'without params' do
    it 'raises bad request error' do
      expect { service.run }.to(
        raise_exception(
          RocketfuelApi::BadRequest, /must provide a 'start_date' argument/
        )
      )
    end
  end

  context 'with valid params' do
    it 'runs report' do
      response = service.run(
        start_date: '2018-03-21',
        end_date: '2018-03-22',
        dimensions: %w[date],
        metrics: %w[impressions clicks]
      )

      expect(response.size).to eq(2)

      expect(response.first.raw_json).to eq(
        'date' => '2018-03-22',
        'impressions' => 21662,
        'clicks' => 38
      )
    end
  end
end
