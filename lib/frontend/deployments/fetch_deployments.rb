require "frontend/deployments/deployment"
require "registrar/deployment/fetch_all"

module Frontend
  module Deployments
    class FetchDeployments
      def self.[]
        new.execute
      end

      def execute
        fetch_deployments
      end

      private

      def fetch_deployments
        parsed_response.map do |deployment_data|
          Deployment.new(deployment_data)
        end
      end

      def parsed_response
        Registrar::Deployment::FetchAll[].parsed_response
      end
    end
  end
end
