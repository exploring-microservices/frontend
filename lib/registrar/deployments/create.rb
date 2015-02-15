require "registrar/request"

module Registrar
  module Deployments
    class Create
      def self.[](data)
        new(data).execute
      end

      def initialize(data)
        @data = data
      end

      def execute
        Registrar::Request.post(deployments_endpoint, data)
      end

      private

      attr_reader :data

      def deployments_endpoint
        "/deployments"
      end
    end
  end
end
