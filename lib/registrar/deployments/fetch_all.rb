require "httparty"

module Registrar
  module Deployments
    class FetchAll
      def self.[](registrar_url: ENV["REGISTRAR_URL"])
        new(registrar_url: registrar_url).execute
      end

      def initialize(registrar_url: ENV["REGISTRAR_URL"])
        @registrar_url = registrar_url
      end

      def execute
        HTTParty.get(fetch_deployments_uri).parsed_response
      end

      private

      attr_reader :registrar_url

      def fetch_deployments_uri
        registrar_uri.merge(deployments_path)
      end

      def registrar_uri
        URI::Parser.new.parse(registrar_url)
      end

      def deployments_path
        "/deployments"
      end
    end
  end
end
