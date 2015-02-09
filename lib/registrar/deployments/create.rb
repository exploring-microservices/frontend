require "httparty"

module Registrar
  module Deployments
    class Create
      def self.[](data, registrar_url: ENV["REGISTRAR_URL"])
        new(data, registrar_url: registrar_url).execute
      end

      def initialize(data, registrar_url: ENV["REGISTRAR_URL"])
        @data = data
        @registrar_url = registrar_url
      end

      def execute
        HTTParty.post(create_deployments_uri, options)
      end

      private

      attr_reader :data, :registrar_url

      def create_deployments_uri
        registrar_uri.merge(create_deployments_path)
      end

      def registrar_uri
        URI::Parser.new.parse(registrar_url)
      end

      def create_deployments_path
        "/deployments"
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
