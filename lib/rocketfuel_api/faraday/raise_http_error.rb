# frozen_string_literal: true

module RocketfuelApi
  module Faraday
    module Response
      class RaiseHttpError < ::Faraday::Response::Middleware
        EXCEPTIONS = {
          400 => RocketfuelApi::BadRequest,
          401 => RocketfuelApi::Unauthorized,
          403 => RocketfuelApi::Forbidden,
          404 => RocketfuelApi::NotFound,
          406 => RocketfuelApi::NotAcceptable,
          422 => RocketfuelApi::UnprocessableEntity,
          500 => RocketfuelApi::InternalServerError,
          501 => RocketfuelApi::NotImplemented,
          502 => RocketfuelApi::BadGateway,
          503 => RocketfuelApi::ServiceUnavailable
        }.freeze

        def on_complete(response)
          http_status = response.status.to_i

          return if http_status == 200

          exception = EXCEPTIONS.fetch(http_status)

          raise exception, response.body
        end

        def error_message(response)
          "#{response.method.to_s.upcase} #{response.url}: #{response.status} - #{response.body}"
        end
      end
    end
  end
end
