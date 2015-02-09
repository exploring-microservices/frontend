require "httparty"

module Registrar
  module Deployment
    class Create
      def self.[](data, registrar_url: ENV["REGISTRAR_URL"])
        new(data, registrar_url: registrar_url).execute
      end

      def initialize(data, registrar_url: ENV["REGISTRAR_URL"])
        @data = data
        @registrar_url = registrar_url
      end

      def execute
        HTTParty.post(create_deployment_uri, options)
      end

      private

      attr_reader :data, :registrar_url

      def create_deployment_uri
        registrar_uri.merge(create_deployment_path)
      end

      def registrar_uri
        URI::Parser.new.parse(registrar_url)
      end

      def create_deployment_path
        "/deployment"
      end

      def options
        { body: body, headers: headers }
      end

      def body
        data.to_json
      end

      def headers
        { "Content-Type" => "application/json" }
      end

    end
  end
end
