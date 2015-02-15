require "httparty"

module Registrar
  class Request
    def self.get(endpoint, registrar_url: ENV["REGISTRAR_URL"])
      new(Net::HTTP::Get, endpoint, registrar_url: registrar_url).execute
    end

    def self.post(endpoint, data, registrar_url: ENV["REGISTRAR_URL"])
      new(Net::HTTP::Post, endpoint, data, registrar_url: registrar_url).execute
    end

    def initialize(method, endpoint, data=nil, registrar_url: ENV["REGISTRAR_URL"])
      @method = method
      @endpoint = endpoint
      @registrar_url = registrar_url
      @data = data
    end

    def execute
      ::HTTParty::Request.new(method, url, options).perform.parsed_response
    end

    private

    attr_reader :method, :endpoint, :registrar_url, :data

    def url
      URI.join(registrar_url, endpoint)
    end

    def options
      if data.nil?
        {}
      else
        { headers: headers, body: data.to_json }
      end
    end

    def headers
      { "Content-Type" => "application/json" }
    end

  end
end
