require "httparty"
require "registrar/configure"

module Registrar
  class Request
    def self.get(endpoint)
      new(Net::HTTP::Get, endpoint).execute
    end

    def self.post(endpoint, data)
      new(Net::HTTP::Post, endpoint, data).execute
    end

    def initialize(method, endpoint, data=nil)
      @method = method
      @endpoint = endpoint
      @data = data
    end

    def execute
      ::HTTParty::Request.new(method, url, options).perform.parsed_response
    end

    private

    attr_reader :method, :endpoint, :data

    def url
      URI.join(Registrar.configuration.registrar_url, endpoint)
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
