require "registrar/request"

module Registrar
  module Deployments
    class FetchAll
      def self.[]()
        new.execute
      end

      def initialize
      end

      def execute
        Registrar::Request.get(deployments_endpoint)
      end

      private

      def deployments_endpoint
        "/deployments"
      end
    end
  end
end
