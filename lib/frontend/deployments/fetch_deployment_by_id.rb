require "frontend/deployments/deployment"
require "registrar/deployments/fetch_by_id"

module Frontend
  module Deployments
    class FetchDeploymentById
      def self.[](id)
        new(id).execute
      end

      def initialize(id)
        @id = id
      end

      def execute
        fetch_deployment
      end

      private

      attr_reader :id

      def fetch_deployment
        Deployment.new(deployment)
      end

      def deployment
        Registrar::Deployments::FetchById[id]
      end
    end
  end
end
