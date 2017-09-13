# frozen_string_literal: true

class RocketfuelApi::Service::CampaignPixel < RocketfuelApi::Service
  def initialize(connection)
    @read_only = true

    super(connection)
  end
end
