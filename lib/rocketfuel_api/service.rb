# frozen_string_literal: true

class RocketfuelApi::Service
  def initialize(connection)
    @connection = connection
  end

  def resource_class
    @resource_class ||= begin
      resource_name = name.capitalize.gsub(/(_(.))/) { |_c| Regexp.last_match(2).upcase }
      RocketfuelApi::Resource.const_get(resource_name)
    end
  end

  def name
    @name ||= begin
      str = self.class.name.split('::').last
      str.gsub(/(.)([A-Z])/, '\1_\2').downcase
    end
  end

  def plural_name
    name + 's'
  end

  def uri_suffix
    plural_name
  end

  def get(id, params = {})
    params = params.merge("#{name}_id" => id)

    response = @connection.get(uri_suffix, params).body

    parse_response(response)
  end

  def get_all(params = {})
    response = @connection.get(uri_suffix, params).body

    parse_response(response)
  end

  def create(route_params = {}, body = {})
    raise(RocketfuelApi::NotImplemented, 'Service is read-only.') if @read_only

    body = { uri_name => body }
    route = @connection.build_url(uri_suffix, route_params)
    response = @connection.post(route, body)

    if response.status != 200
      raise RocketfuelApi::BadRequest, response.inspect
    end

    parse_response(response.body)
  end

  def update(id, route_params = {}, body = {})
    raise(AppnexusApi::NotImplemented, 'Service is read-only.') if @read_only

    body = { uri_name => body }
    route = @connection.build_url(uri_suffix, route_params.merge('id' => id))
    response = @connection.put(route, body)

    if response.status != 200
      raise RocketfuelApi::BadRequest, response.inspect
    end

    parse_response(response.body)
  end

  def parse_response(response)
    case response
    when Array
      response.map do |json|
        resource_class.new(json, self)
      end
    when Hash
      resource_class.new(response, self)
    else
      raise format("Can't parse response, it's a %s", response.class)
    end
  end
end
