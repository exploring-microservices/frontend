require "registrar/request"

module Registrar
  module Deployments
    class FetchById
      def self.[](id)
        new(id).execute
      end

      def initialize(id)
        @id = id
      end

      def execute
        Registrar::Request.get(deployment_endpoint)
      end

      private

      attr_reader :id

      def deployment_endpoint
        "/deployments/#{id}"
      end
    end
  end
end
